#!/bin/sh

TMP=/tmp/$RANDOM.h264
OUTPUT=~/videos/vid_`date +%Y%m%d-%H%M%S`.mp4

/opt/vc/bin/raspivid \
--rotation 180 \
--width 1440 \
--height 1080 \
--nopreview \
--timeout 30000 \
--framerate 30 \
--qp 32 \
--bitrate 0 \
--awb auto \
--output $TMP

MP4Box -add $TMP $OUTPUT.mp4
rm $TMP

