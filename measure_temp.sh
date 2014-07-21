#!/bin/sh

echo `date` `/opt/vc/bin/vcgencmd measure_temp` >> ~/temperature.log
