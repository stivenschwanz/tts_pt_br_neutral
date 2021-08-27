#!/bin/bash
# take the scripts's parent's directory to prefix all the output paths.
RUN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $RUN_DIR

#######################################
# Select CUDA 11.1
#######################################
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export CUDA_LIBS=/usr/local/cuda/lib64



#######################################
# Training ....
#######################################
cd TTS
# change the GPU id if needed                                  
CUDA_VISIBLE_DEVICES="0" python3 TTS/bin/train_tts.py --config_path ../pt_br_neutral_model_config.json \
                                                     --output_path ../checkpoints \
                                                     --coqpit.datasets.0.path ../pt_br_neutral_corpus/ \
                                                     --coqpit.audio.stats_path ../scale_stats.npy #--vocoder_name vocoder_models/universal/libri-tts/fullband-melgan                                                
