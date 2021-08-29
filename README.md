# Brazilian Portuguese Text-to-speech (TTS)

## Intro

This repository offers some useful scripts to help:
* creating or using a single-voice Brazilian Portuguese corpus based on the [Edresson Portuguese corpus](https://github.com/Edresson/TTS-Portuguese-Corpus). Many thanks for his great job!
* setting up the trainning environment;
* preparing/pre-processing the Brazilian Portuguese corpus for trainning;
* trainning the Tacotron2 network using the [Coqui TTS](https://github.com/coqui-ai/TTS). Many thanks for their very clever/convenient TTS implementation!
* testing the trainned Tacotron2 network.

## Scripts

Clone this repository as follows:
```sh
git clone https://github.com/stivenschwanz/tts_pt_br_neutral.git
cd tts_pt_br_neutral
chmod +x *.sh
```

Run the following script to setup the trainning environment:
```sh
./setup.sh
```

Then, execute the script below to download the Brazilian Portuguese corpus, split it into trainning/validation datasets and extract relevant statistics:
```sh
./prep.sh
```

Alternatively, create your own Brazilian Portuguese corpus as follows (make sure to change the parameters e.g. the gender in the `pt_br_corpus.py` file):
```sh
python3 pt_br_corpus.py
```

In the sequel, start the training process (make sure the CUDA options are properly set up for your machine):
```sh
./train.sh
```

Finally, evaluate the trainned network as follows (make sure to select the proper checkpoint):
```sh
./test.sh
```

## Todo list

Some planned/required improvements:
* create a Colab notebook to run all scripts at once (there is a draft [here](https://drive.google.com/file/d/1hTOofYN8rGsPKUJY92qa5bvoXu2RGuag/view?usp=sharing));
* use a multi-voice Brazilian Portuguese corpus;
* setup an Conda environment to run the Python scripts.
