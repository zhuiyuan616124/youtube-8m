model=$1
conf=$2
train_path=/Youtube-8M/model_predictions/ensemble_train

train_data_patterns=""
for d in $(cat $conf); do
  train_data_patterns="${train_path}/${d}/*.tfrecord${train_data_patterns:+,$train_data_patterns}"
done
echo $train_data_patterns
input_data_pattern="${train_path}/model_input/*.tfrecord"

CUDA_VISIBLE_DEVICES=1 python train.py \
      --train_dir="../model/${model}" \
      --train_data_patterns="$train_data_patterns" \
      --input_data_pattern="$input_data_pattern" \
      --model=InputMoeModel \
      --keep_checkpoint_every_n_hours=0.1 \
      --batch_size=1024 \
      --num_epochs=5