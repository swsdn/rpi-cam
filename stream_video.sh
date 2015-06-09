#!/bin/sh

/opt/vc/bin/raspivid \
--rotation 180 \
--width  640 \
--height 480 \
--nopreview \
--timeout 30000 \
--framerate 30 \
--intra 60 \
--bitrate 500000 \
--awb auto \
--output -
