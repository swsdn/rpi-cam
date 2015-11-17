#!/bin/sh

TEMP=`/opt/vc/bin/vcgencmd measure_temp`
DATE=`date`
echo $DATE $TEMP >> ~/temperature.log
