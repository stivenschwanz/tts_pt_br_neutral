#!/bin/bash
# take the scripts's parent's directory to prefix all the output paths.
RUN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $RUN_DIR

#######################################
# Testing...
#######################################
cd TTS
CUDA_VISIBLE_DEVICES="0" python3 TTS/bin/synthesize.py --text "olá, tudo bem? vamos andar" --model_path ../pt_br_neutral_checkpoints/pt_br_neutral_tacotron2-ddc-agosto-14-2021_06+57-c3082267/best_model.pth.tar --config_path ../pt_br_neutral_checkpoints/pt_br_neutral_tacotron2-ddc-agosto-14-2021_06+57-c3082267/config.json
aplay tts_output.wav



