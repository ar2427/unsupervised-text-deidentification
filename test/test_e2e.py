import pytest

import torch

from pytorch_lightning import Trainer, seed_everything

from dataloader import WikipediaDataModule
from model import DocumentProfileMatchingTransformer

class TestEnd2End:
    @pytest.fixture
    def setup(self):
        seed_everything(88)
    
    def _run_e2e_test(self, tmpdir: str, document_model: str, profile_model: str, max_seq_length: 32):
        dm = WikipediaDataModule(
            document_model_name_or_path=document_model,
            profile_model_name_or_path=profile_model,
            max_seq_length=max_seq_length,
            dataset_name='wiki_bio',
            dataset_train_split='train[:50]',
            dataset_val_split='val[:50]',
            dataset_version='1.2.0',
            word_dropout_ratio=0.2,
            word_dropout_perc=0.3,
            sample_spans=True,
            train_batch_size=16,
            eval_batch_size=3,
            num_workers=0,
        )
        dm.setup("fit")
        
        model = DocumentProfileMatchingTransformer(
            document_model_name_or_path=document_model,
            profile_model_name_or_path=profile_model,
            train_batch_size=64,
            learning_rate=1e-6,
            pretrained_profile_encoder=False,
            lr_scheduler_factor=0.5,
            lr_scheduler_patience=1000,
            adversarial_mask_k_tokens=0,
            num_workers=0,
        )
        trainer = Trainer(
            default_root_dir=tmpdir,
            val_check_interval=0.5,
            callbacks=[],
            max_epochs=1,
            log_every_n_steps=min(len(dm.train_dataloader()), 50),
            limit_train_batches=1.0, # change this to make training faster (1.0 = full train set)
            limit_val_batches=1.0,
            gpus=torch.cuda.device_count(),
            logger=[],
        )
        trainer.fit(model, dm)

    def test_end_to_end_distilbert(self, tmpdir):
        self._run_e2e_test(tmpdir, 'distilbert-base-uncased',  'distilbert-base-uncased', 32)

    def test_e2e_tapas(self, tmpdir):
        self._run_e2e_test(tmpdir, 'distilbert-base-uncased',  'google/tapas-base', 32)