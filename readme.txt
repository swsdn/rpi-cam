useful commands:

sshfs host:/root /path/folder/

stream video with netcat
./stream_video.sh |nc -l -p 9567
mplayer -fps 200 -demuxer h264es ffmpeg://tcp://kamerka:9567
