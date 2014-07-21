#!/bin/sh

/opt/vc/bin/raspivid -rot 180 -n --timeout 60000 --bitrate 10000000  -o ~/videos/vid_`date +%Y%m%d-%H%M%S`.h264

#`date +%Y%m%d-%H%M%S`.jpg

