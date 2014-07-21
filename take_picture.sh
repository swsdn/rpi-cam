#!/bin/sh

/opt/vc/bin/raspistill -rot 180 -n --timelapse 300000 --timeout 86400000 -q 8 -o ~/photos/`date +%Y%m%d-%H%M%S`-%04d.jpg

#night photos, not working :(
#/opt/vc/bin/raspistill -t 240000 -ss 24000000 -n -q 100 --ISO 100 -o photos/`date +%Y%m%d-%H%M%S`-%04d.jpg


#`date +%Y%m%d-%H%M%S`.jpg

