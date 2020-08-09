#!/bin/bash
# run testing process

# $1 : Experiment name
# $2 : Cuda id

CONFIG="dlhlp_test"
DIR="/home/eegroup/eetest21/b07701209/End-to-end-ASR-Pytorch/model_and_log_dir"

echo "Start running testing process of E2E ASR"
CUDA_VISIBLE_DEVICES=$2 python3 main.py --config config/${CONFIG}.yaml \
    --name $1 \
	--test \
    --njobs 8 \
    --seed 0 \
    --ckpdir ${DIR}/ckpt/$1 \
	--outdir ${DIR}/test_result/$1

# Eval
python3 eval.py --file ${DIR}/test_result/$1/$1_dev_output.csv
python3 eval.py --file ${DIR}/test_result/$1/$1_test_output.csv
