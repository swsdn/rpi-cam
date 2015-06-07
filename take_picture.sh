#!/bin/sh

/opt/vc/bin/raspistill -rot 180 --nopreview --timeout 1 --quality 8 --thumb none --exposure auto --output ~/photos/`date +%Y%m%d-%H%M%S`.jpg

