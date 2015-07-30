#!/bin/bash

THRESHOLD=10
ONE="one.jpg"
TWO="two.jpg"
SNAPSHOT_INTERVAL=1800
lastStamp=0

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
               		echo `date` "Motion! value: $MOTION";
			#~/rpi-cam/take_picture.sh
			~/rpi-cam/take_video.sh
		else
			echo `date` "No motion. value: $MOTION"
        	fi
	fi

	STAMP=$(($(date +%s) - $lastStamp))
	if (( "$STAMP" >= "$SNAPSHOT_INTERVAL" )); then
		lastStamp=$(date +%s)
		echo "Taking snapshot"
		~/rpi-cam/take_picture.sh
	fi
done

