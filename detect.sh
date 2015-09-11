#!/bin/bash

MOTIONTRACK=/usr/local/bin/motiontrack
TAKE_PHOTO_FAST=~/rpi-cam/take_picture_fast.sh
TAKE_SNAPSHOT=~/rpi-cam/take_picture.sh
TAKE_VIDEO=~/rpi-cam/take_video.sh

LOG=~/photos_fast/detect.log
THRESHOLD=72
ONE="one.jpg"
TWO="two.jpg"
SNAPSHOT_INTERVAL=1800
lastStamp=0

touch $LOG
$TAKE_PHOTO_FAST $ONE
next=$TWO
while true
do
        $TAKE_PHOTO_FAST $next
	if [ "$next" == "$TWO" ]; then
		next=$ONE
	else
		next=$TWO
	fi

	FILES=(*.jpg)
	if (( "${#FILES[@]}" > "1" )); then
        	MOTION=$($MOTIONTRACK -s 9 ${FILES[0]} ${FILES[1]}  2>/dev/null |head -n1)
        	if (( "$MOTION" >= $THRESHOLD )); then
               		echo `date` "Motion! value: $MOTION" >> $LOG
			# prevent comparison from before taking video
			rm ${FILES[0]} ${FILES[1]}
			$TAKE_VIDEO $MOTION
		else
			echo `date` "No motion. value: $MOTION" >> $LOG
        	fi
	fi

	STAMP=$(($(date +%s) - $lastStamp))
	if (( "$STAMP" >= "$SNAPSHOT_INTERVAL" )); then
		lastStamp=$(date +%s)
		echo "Taking snapshot" >> $LOG
		$TAKE_SNAPSHOT
	fi
done

