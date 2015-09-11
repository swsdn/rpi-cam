#!/bin/sh

TMP=/tmp/$RANDOM.h264
OUTPUT=~/videos/`date +%Y%m%d-%H%M%S`_$1.mp4

/opt/vc/bin/raspivid \
--rotation 180 \
--width 1440 \
--height 1080 \
--nopreview \
--timeout 15000 \
--framerate 30 \
--qp 32 \
--bitrate 0 \
--awb auto \
--output $TMP

MP4Box -add $TMP $OUTPUT
rm $TMP

