#!/bin/bash

VHOST=`ip route get 8.8.8.8|awk '{print $NF; exit;}'`

PORT=3000
API_PUBLIC_KEY_PATH=http://$VHOST:$PORT/api/public_key

sudo docker run
	-p "5672:5672" \
	-p "1883:1883" \
	-p "8883:8883" \
	-p "3002:15675" \
	-e "PKAPIURL=$API_PUBLIC_KEY_PATH" \
	-e "VHOST=$VHOST" \
	--name "farmbot-mqtt" \
	farmbot-mqtt \
	"/start.sh"
