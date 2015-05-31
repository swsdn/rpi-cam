#!/bin/sh

mkdir -p /tmp/photos
/opt/vc/bin/raspistill --mode 6 --width 640 --height 480  -rot 180 --nopreview --timeout 1 --quality 8 --thumb none --exposure auto --output /tmp/photos/`date +%Y%m%d-%H%M%S`.jpg


