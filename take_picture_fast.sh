#!/bin/sh

mkdir -p ~/photos_fast
/opt/vc/bin/raspistill \
-rot 180 \
--width 320 --height 240 \
--nopreview \
--timeout 1 \
--quality 75 \
--thumb none \
--stats \
--output ~/photos_fast/$1
