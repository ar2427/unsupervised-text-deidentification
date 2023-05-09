from typing import Dict, List, Tuple

import collections
import functools
import itertools
import re

import pandas as pd
import torch
import transformers

from model import ContrastiveModel, ContrastiveCrossAttentionModel, CoordinateAscentModel


@functools.lru_cache()
def fuzz_ratio(s1: str, s2: str) -> bool:
    import fuzzywuzzy.fuzz
    return fuzzywuzzy.fuzz.ratio(s1, s2)


def find_row_from_key(table_rows: List[str], key: str) -> Tuple[str, str]:
    """Finds row in wikipedia infobox by a key

    Raises: AssertionError if key not found
    """
    matching_rows = [r for r in table_rows if r[0] == key]
    assert len(matching_rows) > 0, f"name not found in table_rows: {table_rows}"
    return matching_rows[0]


def name_from_table_rows(table_rows: List[str]) -> str:
    """gets person's name from rows of a Wikipedia infobox"""
    try:
        row = find_row_from_key(table_rows, key='name')
    except AssertionError:
        # a few articles have this key instead of a 'name' key
        row = find_row_from_key(table_rows, key='article_title')
    name = row[1]
    # capitalize name and return
    return ' '.join((word.capitalize() for word in name.split()))


def get_table_minus_name(table_rows: List[str]) -> List[str]:
    """gets person's name from rows of a Wikipedia infobox"""
    out_rows = []
    for row in table_rows:
        if row[0] in ['name', 'article_title']: continue
        out_rows.append(row)
    return out_rows


words_from_text_re = re.compile(r'\b\w+\b')
def word_start_and_end_idxs_from_text(s: str) -> List[Tuple[int, int]]:
    assert isinstance(s, str)
    return [(m.start(0), m.end(0)) for m in words_from_text_re.finditer(s)]


def words_from_text(s: str) -> List[str]:
    assert isinstance(s, str)
    return words_from_text_re.findall(s)


def wikibio_example_has_non_redacted_rows(ex: Dict[str, str]) -> bool:
    """Filters out dataset examples that don't have any non-redacted rows."""
    table_info = ex['input_text']['table']
    table_column_header, table_content = list(table_info['column_header']), list(table_info['content'])
    return len(set(table_column_header) - set(redacted_headers)) > 0


def create_document_and_profile_from_wikibio(ex: Dict[str, str],) -> Dict[str, str]:
    """
    transforms wiki_bio example into (document, profile) pair

    >>> ex['target_text']
    'walter extra is a german award-winning aerobatic pilot , chief aircraft designer and founder of extra....
    >>> ex['input_text']
    {'table': {'column_header': ['nationality', 'name', 'article_title', 'occupation', 'birth_date'], 'row_number': [1, 1, 1, 1, 1], 'content': ['german', 'walter extra', 'walter extra\n', 'aircraft designer and manufacturer', '1954']}, 'context': 'walter extra\n'}

    Args: 
        ex (Dict[str, str]): examples from wiki_bio dataset
    Returns:
        Dict[str, str] of important fields like name, document, profile.
    """
    # replace weird textual artifacts: -lrb- with ( and -rrb- with )
    fixed_target_text = ex['target_text'].replace('-rrb-', ')').replace('-lrb-', '(')
    # transform table to str
    table_info = ex['input_text']['table']
    table_column_header, table_content = list(table_info['column_header']), list(table_info['content'])

    profile_keys = list(map(lambda s: s.strip().replace('|', ''), table_column_header))
    profile_values = list(map(lambda s: s.strip().replace('|', ''), table_content))
    table_rows = list(zip(profile_keys, profile_values))
    table_text = '\n'.join([' || '.join(row) for row in table_rows])
    # table_text_without_name = (
    #     '\n'.join([' | '.join(row) for row in get_table_minus_name(table_rows)])
    # )

    # return example: transformed table + first paragraph
    return {
        'name': name_from_table_rows(table_rows),
        'document': fixed_target_text,                          # First paragraph of biography
        'profile': table_text,                                  # Table re-printed as a string
        # 'profile_without_name': table_text_without_name,      # Table with name removed
        'profile_keys': '||'.join(profile_keys),                # Keys in profile box
        'profile_values': '||'.join(profile_values),            # Values in profile box
        'text_key': ex['target_text'] + ' ' + table_text,       # (document, profile) str key
    }


def create_document_and_profile_from_dalio(ex: Dict[str, str],) -> Dict[str, str]:
    """
    transforms dalio example into (document, profile) pair
    """
    profile_keys = [
       # 'index', 
        'person_id', 
       # 'note_id', 'note_date', 'note_datetime', 
       # 'note_type', 'note_class', 'note_words'
       'empi_id', 'mrn', 'gender', 'year_of_birth', 'month_of_birth',
       'day_of_birth', 'race', 'ethnicity', 'death_date', 'death_datetime',
       'address_1', 'address_2', 'city', 'state', 'zip', 'county',
        # missing: name...
    ]
    profile_values = [str(ex[key]).strip() for key in profile_keys]

    table_rows = list(zip(profile_keys, profile_values))
    table_text = '\n'.join([' || '.join(row) for row in table_rows])

    note_text = ex['note_text\n'].strip()

    # return example: transformed table + first paragraph
    return {
        'name': str(ex['person_id']),
        'document': note_text,                          # First paragraph of biography
        'profile': table_text,                                  # Table re-printed as a string
        # 'profile_without_name': table_text_without_name,      # Table with name removed
        'profile_keys': '||'.join(profile_keys),                # Keys in profile box
        'profile_values': '||'.join(profile_values),            # Values in profile box
        'text_key': note_text + ' ' + table_text,               # (document, profile) str key
        'text_key_id': int(ex['person_id']),                    # The ID of the person
                                                                #   (careful! this will be used 
                                                                #    for optimization!)
    }


def dict_union(*dicts):
    """Combines N dictionaries (with different keys) together."""
    return dict(itertools.chain.from_iterable(dct.items() for dct in dicts))


def try_encode_table_tapas(df: pd.DataFrame, tokenizer: transformers.AutoTokenizer, max_length: int, query: str, num_cols: int = 50) -> Dict[str, torch.Tensor]:
    if num_cols <= 0:
        raise ValueError(f'failed to encode df: {str(df)}')
    try:
        return tokenizer(
            table=df[df.columns[:num_cols]],
            queries=[query],
            max_length=max_length,
            padding='max_length',
            truncation=True,
            return_tensors='pt',
        )
    except ValueError:
        return try_encode_table_tapas(df=df, tokenizer=tokenizer, max_length=max_length, query=query, num_cols=num_cols-1)


def get_profile_df(keys: List[str], values: List[str]) -> pd.DataFrame:
    """Creates a dataframe from a list of keys and list of values. Used for TAPAS and
    other table-based models.
    """
    assert isinstance(keys, list) and len(keys) and isinstance(keys[0], str)
    assert isinstance(values, list) and len(values) and isinstance(values[0], str)
    return pd.DataFrame(columns=keys, data=[values])


def tokenize_profile(
        tokenizer: transformers.PreTrainedTokenizer,
        ex: Dict[str, str],
        max_seq_length: int,
        use_redacted_profile: bool = False
    ) -> Dict[str, torch.Tensor]:
    prefix = "redacted_" if use_redacted_profile else ""
    if isinstance(tokenizer, transformers.TapasTokenizer):
        prof_keys = ex[f"{prefix}profile_keys"].split("||")
        prof_values = ex[f"{prefix}profile_values"].split("||")
        if not len(prof_keys):
            raise ValueError("empty profile_keys")
        if not len(prof_values):
            raise ValueError("empty prof_values")
        df = get_profile_df(
            keys=prof_keys, values=prof_values
        )
        profile_tokenized = try_encode_table_tapas(
            df=df,
            tokenizer=tokenizer,
            max_length=max_seq_length,
            query="Who is this?",
            num_cols=64
        )
        # print(df)
    else:
        profile_tokenized = tokenizer.encode_plus(
            ex[f"{prefix}profile"],
            max_length=max_seq_length,
            padding='max_length',
            truncation=True,
            return_tensors='pt',
        )
    return profile_tokenized


model_cls_dict = {
    'coordinate_ascent': CoordinateAscentModel,
    'contrastive_cross_attention': ContrastiveCrossAttentionModel,
    'contrastive': ContrastiveModel,
}