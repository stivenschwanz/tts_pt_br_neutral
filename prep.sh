#!/bin/bash
# take the scripts's parent's directory to prefix all the output paths.
RUN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $RUN_DIR

#######################################
# TTS checkpoints
#######################################
mkdir checkpoints
cd checkpoints
gdown --id 1WZdLA0yF35J1cQBvlTvSiLdru1pj4erI
unzip tacotron2-ddc-agosto-20-2021_12+14-c3082267.zip
cd..

#######################################
# PT-BR neutral corpus
#######################################
gdown --id 1nf2GxGO5nrAprj2kGQGUXmedOjEMM0S5
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

