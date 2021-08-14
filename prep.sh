#!/bin/bash
# take the scripts's parent's directory to prefix all the output paths.
RUN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $RUN_DIR

#######################################
# TTS checkpoints
#######################################
cd ..
# download config
wget https://www.dropbox.com/s/zdt3iu6giecd3kn/config.json
# download checkpoint
wget https://www.dropbox.com/s/rxchxzdqopjgze6/best_model.pth.tar

#######################################
# PT-BR neutral corpus
#######################################
wget https://www.dropbox.com/s/81bfzl597k506h2/pt_br_corpus_neutral.zip
unzip pt_br_corpus_neutral.zip

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
python3.8 TTS/bin/compute_statistics.py ../tacotron2-DDC.json ../scale_stats.npy --data_path ../pt_br_neutral_corpus/
#python3.8 TTS/bin/compute_statistics.py ../config.json ../scale_stats.npy --data_path ../pt_br_neutral_corpus/
