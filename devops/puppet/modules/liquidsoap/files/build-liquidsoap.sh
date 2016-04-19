#!/bin/bash

# cd /tmp
# wget https://github.com/savonet/liquidsoap/releases/download/1.2.0/liquidsoap-1.2.0-full.tar.bz2
# tar xjvf liquidsoap-1.2.0-full.tar.bz2
# cd liquidsoap-1.2.0-full
# cp PACKAGES.default PACKAGES
# ./bootstrap
# ./configure
# make
# make install

cd /home/vagrant
opam install cry alsa pulseaudio mad taglib lame ogg vorbis opus voaacenc fdkaac faad flac ladspa soundtouch samplerate xmlplaylist dtools duppy mm liquidsoap
