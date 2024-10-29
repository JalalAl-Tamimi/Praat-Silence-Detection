To cite, use: [![DOI](https://zenodo.org/badge/515152882.svg)](https://zenodo.org/badge/latestdoi/515152882)

To access scripts and supporting documents, download the whole repository from [here](https://github.com/JalalAl-Tamimi/Praat-Silence-Detection). You can access it by clicking on "View on GitHub" on top.

There are two version of this script:

1) The script "detect_silence_speech_V1.praat" is to be used if you have a Praat version 6.3.22 or below.
2) The script "detect_silence_speech_V2.praat" is to be used for any version of Praat above 6.4. These new versions use the updated Praat algorithm for detection of pitch
3) 
The two scripts "detect_silence_speech_V1.praat" and "detect_silence_speech_V2.praat" provide an automated method to detect silence based on a sound file. 
This uses the following specifications:
1. The Two-pass method for estimation f0 range adapted to each speaker; uses the cross-correlation method
2. The the range of f0 (between 5-95%) is obtained
3. Intensity is then computed based on the lowest value for f0 obtained at 5% (f0 floor)
4. Intensity range is obtained (between 5-95%); SD is also computed
5. The silence threshold is estimated based on range - SD/2

Pauses are marked with "xxx"; speech with an empty interval

An outputted TextGrid is provided.

Make sure to cite this github repo when using this script

