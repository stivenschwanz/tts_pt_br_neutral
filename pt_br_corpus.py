#!/usr/local/bin/python3.5
#
# LISTEN and SPEAK module
# [START import_libraries]
from __future__ import division
import os
import re
import sys
import pyaudio
import csv

from google.cloud import speech_v1 as speech
from google.cloud import texttospeech_v1 as texttospeech


def synthesize(text, speech_file, corpus_dir):
    # Instantiates a client
    client = texttospeech.TextToSpeechClient()

    # Set the text input to be synthesized
    input = texttospeech.SynthesisInput(text=text)

    # Build the voice request, select the language code ("pt-BR") and the ssml
    # voice gender ("neutral")
    voice = texttospeech.VoiceSelectionParams(
        language_code='pt-BR',
        ssml_gender=texttospeech.SsmlVoiceGender.NEUTRAL)

    # Select the type of audio file you want returned
    audio_config = texttospeech.AudioConfig(
        audio_encoding=texttospeech.AudioEncoding.LINEAR16)

    # Perform the text-to-speech request on the text input with the selected
    # voice parameters and audio file type
    response = client.synthesize_speech(input=input, voice=voice, audio_config=audio_config)

    # The response's audio_content is binary.
    total_path = corpus_dir + speech_file
    
    with open(total_path, 'wb') as out:
        # Write the response to the output file.
        out.write(response.audio_content)


def create_corpus(corpus_file, corpus_dir):
    with open(corpus_file, newline='') as csvfile:
        speech_reader = csv.reader(csvfile, delimiter='|', quotechar='"')
        for row in speech_reader:
            speech_file = row[0]
            print(speech_file)
            text = row[1]
            print(text)
            synthesize(text, speech_file, corpus_dir)
            

create_corpus('pt_br_corpus/metadata.csv','pt_br_corpus/wavs/')



