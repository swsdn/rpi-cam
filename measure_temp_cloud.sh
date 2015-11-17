#!/bin/sh

TEMP=`/opt/vc/bin/vcgencmd measure_temp|cut -d'=' -f2|cut -d"'" -f1`

URL="https://api.thingspeak.com/update?key=$1&field1=$TEMP"
curl -s -XPOST $URL > /dev/null
