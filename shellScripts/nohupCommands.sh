#python main.py --epochs 1000 --batch_size 64 --max_seq_length 128 --word_dropout_ratio 0.8 --word_dropout_perc -1.0 --document_model_name roberta --profile_model_name tapas --local_data_path "/prj0124_gpu/jom4024/cleaned_data/df_unique_50_word_notes_top1_per_person.parquet" --dataset_source "parquet" --dataset_train_split="train[:70%]" --dataset_val_split="val[:15%]" --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 3072 --label_smoothing 0.01 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

#python main.py --epochs 1000 --batch_size 64 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas  --dataset_source huggingface --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

#python main.py --epochs 1000 --batch_size 64 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/jom4024/cleaned_data/df_unique_50_word_notes_top1_per_person.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

# python main.py --epochs 50 --batch_size 64 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas  --dataset_source huggingface --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --dataset_train_split "train[:1%]" --dataset_val_split "val[:1%]" --dataset_test_split "test[:1%]" --precision 16

# python main.py --epochs 1000 --batch_size 64 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/jom4024/cleaned_data/df_unique_50_word_notes_top1_per_person.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

# python main.py --epochs 5000 --batch_size 64 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/akr4007/full_csv_most_relevant_note_per_person.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-5 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

# python main.py --epochs 5000 --batch_size 64 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/akr4007/full_csv_most_relevant_note_per_person.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-5 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --checkpoint_path /prj0124_gpu/akr4007/unsupervised-text-deidentification/deid_on_weill/1qw9di20/checkpoints/epoch=607-step=6080.ckpt  --precision 16

# python main.py --epochs 5000 --batch_size 64 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/akr4007/full_csv_most_relevant_note_per_person_masked_till_18000.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-5 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --checkpoint_path /prj0124_gpu/akr4007/unsupervised-text-deidentification/deid_on_weill/33otb6xv/checkpoints/last-v1_temp.ckpt --precision 16

# python main.py --epochs 5000 --batch_size 64 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/sln4001/full_csv_most_relevant_note_per_person_masked_till_20700.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-5 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification  --precision 16

# python main.py --epochs 5000 --batch_size 64 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/akr4007/data/currently_relevant_data/full_csv_most_relevant_decoded_encoded_notes_per_person.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

# ipython main.py --epochs 5000 --batch_size 64 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/sln4001/full_csv_most_relevant_note_per_person_masked_till_20700.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification  --precision 16

# python main.py --epochs 5000 --batch_size 128 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/akr4007/data/currently_relevant_data/full_csv_most_relevant_decoded_encoded_notes_per_person.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

# python main.py --epochs 5000 --batch_size 128 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/akr4007/data/currently_relevant_data/full_csv_most_relevant_decoded_encoded_notes_per_person.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --checkpoint_path /prj0124_gpu/akr4007/unsupervised-text-deidentification/deid_on_weill/fn0q93nt/checkpoints/last-v1.ckpt --precision 16

# python main.py --epochs 5000 --batch_size 128 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/sln4001/full_csv_most_relevant_decoded_encoded_notes_per_person_masked_till_20700_philter_new.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --checkpoint_path /prj0124_gpu/akr4007/unsupervised-text-deidentification/deid_on_weill/rblrws4k/checkpoints/last-v1.ckpt --precision 16

# python main.py --epochs 5000 --batch_size 128 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/sln4001/full_csv_most_relevant_decoded_encoded_notes_per_person_masked_till_20700_tagged_new.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --checkpoint_path /prj0124_gpu/akr4007/unsupervised-text-deidentification/deid_on_weill/5usm1ohj/checkpoints/last-v1.ckpt --precision 16

# python main.py --epochs 5000 --batch_size 128 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/sln4001/full_csv_most_relevant_decoded_encoded_notes_per_person_masked_till_20700_philter_new.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

# python main.py --epochs 5000 --batch_size 128 --max_seq_length 128 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/sln4001/full_csv_most_relevant_decoded_encoded_notes_per_person_masked_till_20700_tagged_new.parquet  --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

#python main.py --epochs 5000 --batch_size 30 --max_seq_length 512 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/akr4007/data/currently_relevant_data/full_csv_most_relevant_decoded_encoded_512_token_length_notes_per_person.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-4 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

# CUDA_VISIBLE_DEVICES=1 python main.py --epochs 5000 --batch_size 30 --max_seq_length 512 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/akr4007/data/currently_relevant_data/full_csv_most_relevant_decoded_encoded_512_token_length_notes_per_person.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-5 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --checkpoint_path /prj0124_gpu/akr4007/unsupervised-text-deidentification/deid_on_weill/pquwau3h/checkpoints/last.ckpt --precision 16

# CUDA_VISIBLE_DEVICES=1 python main.py --epochs 5000 --batch_size 30 --max_seq_length 512 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/sln4001/full_csv_most_relevant_decoded_encoded_512_token_length_notes_per_person_masked_till_20700_philter_new.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-5 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

# CUDA_VISIBLE_DEVICES=1 python main.py --epochs 5000 --batch_size 30 --max_seq_length 512 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/akr4007/data/currently_relevant_data/full_csv_most_relevant_decoded_encoded_512_token_length_notes_per_person_ehr_masked.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-5 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

# CUDA_VISIBLE_DEVICES=1 python main.py --epochs 5000 --batch_size 30 --max_seq_length 512 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/akr4007/data/currently_relevant_data/full_csv_most_relevant_decoded_encoded_512_token_length_notes_per_person_ehr_masked.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-5 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --checkpoint_path /prj0124_gpu/akr4007/unsupervised-text-deidentification/deid_on_weill/07hlg09a/checkpoints/epoch=14-step=7470.ckpt --precision 16

# CUDA_VISIBLE_DEVICES=0 python main.py --epochs 5000 --batch_size 30 --max_seq_length 512 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/akr4007/data/currently_relevant_data/full_csv_most_relevant_decoded_encoded_512_token_length_notes_per_person_ehr_masked.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-5 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

# CUDA_VISIBLE_DEVICES=0 python main.py --epochs 5000 --batch_size 30 --max_seq_length 512 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/sln4001/full_csv_most_relevant_decoded_encoded_512_token_length_notes_per_person_masked_till_20700_deidentify_new.parquet  --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-5 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16

CUDA_VISIBLE_DEVICES=0 python main.py --epochs 85 --batch_size 30 --max_seq_length 512 --word_dropout_ratio 0.0 --word_dropout_perc 0.0 --document_model_name roberta --profile_model_name tapas --local_data_path /prj0124_gpu/sln4001/full_csv_most_relevant_decoded_encoded_512_token_length_notes_per_person_masked_till_20700_deidentify_threshold_0.81687966.parquet --dataset_source parquet --dataset_train_split=train[:70%] --dataset_val_split=val[:15%] --learning_rate 1e-5 --num_validations_per_epoch 1 --loss coordinate_ascent --e 768 --label_smoothing 0.00 --wandb_project_name deid_on_weill --wandb_entity deidentification --precision 16 --precision 16
