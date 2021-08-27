# Brazilian Portuguese Text-to-speech (TTS)

## Intro

This repository offers some scipts to help:
* using a single-voice Brazilian Portuguese corpus based on the [Edresson Portuguese corpus](https://github.com/Edresson/TTS-Portuguese-Corpus). Many thanks for his great job!
* setting up the trainning environment;
* preparing/pre-processing the Brazilian Portuguese corpus for trainning;
* trainning the Tacotron2 network using the [Coqui TTS](https://github.com/coqui-ai/TTS). Many thanks for their convenient TTS implementation!
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

In the sequel, start the training process (make sure the CUDA options are properly set up for your machine):
```sh
./train.sh
```

Finally, evaluate the trainned network as follows (make sure to set the proper checkpoint):
```sh
./test.sh
```

## Todo list

Some planned/required improvements:
* create a Colab notebook to run all scripts at once;
* use a multi-voice Brazilian Portuguese corpus.
