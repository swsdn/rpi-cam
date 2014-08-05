#!/bin/sh

/opt/vc/bin/raspivid --rotation 180 --width 1440 --height 1080 --verbose --nopreview --timeout 3600000 --framerate 30 --bitrate 3500000 --segment 10000 --wrap 180 --output ~/videos/vid_`date +%Y%m%d-%H%M%S`-%04d.h264

#`date +%Y%m%d-%H%M%S`.jpg

