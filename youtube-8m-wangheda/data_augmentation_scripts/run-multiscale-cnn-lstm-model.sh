CUDA_VISIBLE_DEVICES=0 python train.py \
    --train_dir="../model/dataaugmentation_multiscale_cnn_lstm" \
    --train_data_pattern='/Youtube-8M/data/frame/largetrain/*.tfrecord' \
    --frame_features=True \
    --feature_names="rgb,audio" \
    --feature_sizes="1024,128" \
    --model='MultiscaleCnnLstmModel' \
    --multiscale_cnn_lstm_layers=4 \
    --moe_num_mixtures=4 \
    --multitask=True \
    --label_loss=MultiTaskCrossEntropyLoss \
    --support_loss_percent=1.0 \
    --support_type="label,label,label,label" \
    --is_training=True \
    --num_readers=4 \
    --num_epochs=5 \
    --batch_size=40 \
    --data_augmenter=HalfAugmenter \
    --base_learning_rate=0.001 \
    --keep_checkpoint_every_n_hour=2.0