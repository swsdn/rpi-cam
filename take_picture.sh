#!/bin/sh

/opt/vc/bin/raspistill -rot 180 --roi 0.0,0.0,0.75,0.75 --nopreview --timeout 1 --quality 8 --thumb none --exposure auto --output ~/photos/`date +%Y%m%d-%H%M%S`.jpg

#night photos, not working :(
#/opt/vc/bin/raspistill -t 240000 -ss 24000000 -n -q 100 --ISO 100 -o photos/`date +%Y%m%d-%H%M%S`-%04d.jpg


#`date +%Y%m%d-%H%M%S`.jpg

