#!/bin/sh

mkdir -p /tmp/photos_night
/opt/vc/bin/raspistill \
-rot 180 \
--width 1600 --height 1200 \
--nopreview \
--timeout 5000 \
--shutter 60000000  \
--quality 100 \
--thumb none \
--stats \
--exposure auto \
--output /tmp/photos_night/`date +%Y%m%d-%H%M%S`.jpg
