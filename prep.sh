#!/bin/bash
# take the scripts's parent's directory to prefix all the output paths.
RUN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $RUN_DIR

#######################################
# TTS checkpoints
#######################################
mkdir pt_br_neutral_checkpoints
cd pt_br_neutral_checkpoints
# download config
wget https://www.dropbox.com/s/zdt3iu6giecd3kn/config.json
# download checkpoint
wget https://www.dropbox.com/s/rxchxzdqopjgze6/best_model.pth.tar
cd..
#######################################
# PT-BR neutral corpus
#######################################
wget https://www.dropbox.com/s/81bfzl597k506h2/pt_br_neutral_corpus.zip
unzip pt_br_neutral_corpus.zip

#######################################
# Create train-val splits
#######################################
shuf pt_br_neutral_corpus/metadata.csv > pt_br_neutral_corpus/metadata_shuf.csv
head -n 6000 pt_br_neutral_corpus/metadata_shuf.csv > pt_br_neutral_corpus/metadata_train.csv
tail -n 728 pt_br_neutral_corpus/metadata_shuf.csv > pt_br_neutral_corpus/metadata_val.csv

#######################################
# Compute dataset mean and variance for normalization
#######################################
cd TTS
python3 TTS/bin/compute_statistics.py ../pt_br_neutral_model_config.json ../scale_stats.npy --data_path ../pt_br_neutral_corpus/ --output_path ../checkpoints

