#!/bin/bash
# take the scripts's parent's directory to prefix all the output paths.
RUN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $RUN_DIR

#######################################
# Update python
#######################################
sudo apt install python3.8-dev

#######################################
# Install CUDA 11.1
#######################################
#wget https://developer.download.nvidia.com/compute/cuda/11.1.0/local_installers/cuda_11.1.0_455.23.05_linux.run
#sudo sh cuda_11.1.0_455.23.05_linux.run

#######################################
# Clone Coqui AI TTS
#######################################
git clone https://github.com/coqui-ai/TTS

#######################################
# Install requeriments
#######################################
cd TTS
sudo apt-get install espeak
pip3.8 install -r requirements.txt
sudo python3.8 setup.py install

# The following commands shouldn't be necessary, but...
#pip3.8 install colorama==0.3.9
#pip3.8 install librosa==0.8.0
#pip3.8 install numpy==1.19.5 torch==1.7
#pip3.8 install tensorboard==2.6 h5py==3.1.0

# Workaround to use the GPU (https://pytorch.org/get-started/previous-versions/)

pip install torch==1.7.1+cu101 torchvision==0.8.2+cu101 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html

#pip install torch==1.8.0+cu111 torchvision==0.9.0+cu111 torchaudio==0.8.0 -f https://download.pytorch.org/whl/torch_stable.html


