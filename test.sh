#!/bin/bash
# take the scripts's parent's directory to prefix all the output paths.
RUN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $RUN_DIR

#######################################
# Testing...
#######################################
cd TTS
python3.8 TTS/bin/synthesize.py --text "olá, tudo bem? vamos andar" --model_path ../checkpoints/TTS-Portuguese/GlowTTS/GlowTTS-Trans-Portuguese-agosto-12-2021_11+58-0fc9f387/best_model.pth.tar --config_path ../checkpoints/TTS-Portuguese/GlowTTS/GlowTTS-Trans-Portuguese-agosto-12-2021_11+58-0fc9f387/config.json
aplay tts_output.wav



