#!/bin/bash
# take the scripts's parent's directory to prefix all the output paths.
RUN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $RUN_DIR

#######################################
# Set parameters
#######################################

#MODEL_PATH=../checkpoints/tacotron2-ddc-agosto-19-2021_01+07-c3082267/best_model.pth.tar
#MODEL_CONFIG_PATH=../checkpoints/tacotron2-ddc-agosto-19-2021_01+07-c3082267/config.json

MODEL_PATH=../checkpoints/tacotron2-ddc-agosto-20-2021_12+14-c3082267/best_model.pth.tar
MODEL_CONFIG_PATH=../checkpoints/tacotron2-ddc-agosto-20-2021_12+14-c3082267/config.json

#MODEL_PATH=../checkpoints/stiven/best_model_97280.pth.tar
#MODEL_CONFIG_PATH=../checkpoints/stiven/config.json

VOCODER_PATH=../vocoders/edresson/saver.pth.tar
VOCODER_CONFIG_PATH=../vocoders/edresson/config_16K.json

TEXT="bom dia! tá na hora de matar a fome! tá na mesa pessoal"
#TEXT="O corpo docente era constituído de vinte e nove membros"

#######################################
# Testing...
#######################################
cd TTS
CUDA_VISIBLE_DEVICES="0" python3 TTS/bin/synthesize.py --text "$TEXT" --model_path $MODEL_PATH --config_path $MODEL_CONFIG_PATH #--vocoder_name vocoder_models/universal/libri-tts/fullband-melgan
#--vocoder_path $VOCODER_PATH --vocoder_config_path $VOCODER_CONFIG_PATH

#######################################
# Play audio
#######################################
aplay tts_output.wav



