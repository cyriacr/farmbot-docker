#!/bin/bash
c=`echo $PKAPIURL|sed 's/\//\\\\\//g'`
d=`echo $VHOST|sed 's/\//\\\\\//g'`
sed -i s/FARMBOT_PUBLIC_KEY_URL/$c/g /etc/rabbitmq/rabbitmq.config
sed -i s/VHOST/$d/g /etc/rabbitmq/rabbitmq.config

rabbitmq-server
