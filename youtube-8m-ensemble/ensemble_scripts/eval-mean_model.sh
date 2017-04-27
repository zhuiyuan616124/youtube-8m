model=$1
conf=$2
validate_path=/Youtube-8M/model_predictions/ensemble_validate

validate_data_patterns=""
for d in $(cat $conf); do
  validate_data_patterns="${validate_path}/${d}/*.tfrecord${validate_data_patterns:+,$validate_data_patterns}"
done
echo "$validate_data_patterns"

CUDA_VISIBLE_DEVICES=0 python eval.py \
      --model_checkpoint_path="../model/${model}/model.ckpt-0" \
      --validate_dir="../model/${model}" \
      --model="MeanModel" \
      --eval_data_patterns="$validate_data_patterns"