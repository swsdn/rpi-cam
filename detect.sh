#!/bin/bash

LOG=~/photos_fast/detect.log
THRESHOLD=50
ONE="one.jpg"
TWO="two.jpg"
SNAPSHOT_INTERVAL=1800
lastStamp=0

touch $LOG
~/rpi-cam/take_picture_fast.sh $ONE
next=$TWO
while true
do
        ~/rpi-cam/take_picture_fast.sh $next
	if [ "$next" == "$TWO" ]; then
		next=$ONE
	else
		next=$TWO
	fi

	FILES=(*.jpg)
	if (( "${#FILES[@]}" > "1" )); then
        	MOTION=$(motiontrack -s 9 ${FILES[0]} ${FILES[1]}  2>/dev/null |head -n1)
        	if (( "$MOTION" > "$THRESHOLD" )); then
               		echo `date` "Motion! value: $MOTION" >> $LOG
			#~/rpi-cam/take_picture.sh
			# prevent comparison from before taking video
			rm ${FILES[0]} ${FILES[1]}
			~/rpi-cam/take_video.sh
		else
			echo `date` "No motion. value: $MOTION" >> $LOG
        	fi
	fi

	STAMP=$(($(date +%s) - $lastStamp))
	if (( "$STAMP" >= "$SNAPSHOT_INTERVAL" )); then
		lastStamp=$(date +%s)
		echo "Taking snapshot" >> $LOG
		~/rpi-cam/take_picture.sh
	fi
done

