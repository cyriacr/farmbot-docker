#!/bin/bash

# change to your API server's information
#
APIHOST=`ip route get 8.8.8.8|awk '{print $NF; exit;}'`
APIPORT=3000
PKAPIURL=http://$APIHOST:$APIPORT/api/public_key

# use -it for debug purpose, -d for daemon
OPT=-d

c=`docker ps|grep farmbot-mqtt-server|awk '{print $NF;exit}'`
if [ "$c" != "" ]; then
        docker stop $c
fi

docker run $OPT \
	-p "5672:5672" \
	-p "1883:1883" \
	-p "8883:8883" \
	-p "3002:15675" \
	-e "PKAPIURL=$PKAPIURL" \
	-e "VHOST=/" \
	cyriacr/farmbot-mqtt-server \
	"/start.sh"
