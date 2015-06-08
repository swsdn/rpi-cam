#!/bin/sh

mkdir -p ~/photos_night
/opt/vc/bin/raspistill \
-rot 180 \
--nopreview \
--timeout 5000 \
--shutter 60000000  \
--quality 100 \
--thumb none \
--stats \
--exposure auto \
--output ~/photos_night/`date +%Y%m%d-%H%M%S`.jpg
