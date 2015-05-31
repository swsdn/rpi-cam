#!/bin/sh

TEMP=`/opt/vc/bin/vcgencmd measure_temp`
DATE=`date`
echo $DATE $TEMP >> ~/temperature.log

#mosquitto_pub -h localhost -t rus/pi/temp -m "$DATE $TEMP" -q 1 -i alamakota-rus
