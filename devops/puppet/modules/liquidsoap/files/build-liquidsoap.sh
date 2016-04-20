#!/bin/bash

source /home/vagrant/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

cd /tmp
git clone https://github.com/savonet/liquidsoap-full.git liquidsoap
cd liquidsoap
cp ../PACKAGES .
make init
./bootstrap
./configure --enable-debugging --disable-graphics
make
sudo make install

# cd /home/vagrant
# opam install cry alsa pulseaudio mad taglib lame ogg vorbis opus voaacenc fdkaac faad flac ladspa soundtouch samplerate xmlplaylist dtools duppy mm liquidsoap
