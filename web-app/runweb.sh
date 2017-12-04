#!/bin/bash

HOSTIP=`ip route get 8.8.8.8|awk '{print $NF; exit;}'`

# use you own postgresql information
PGHOST=$HOSTIP
PGPORT=5432
PGUSER=farmbot
PGPASS=farmbot1234
PGDBNAME=farmbot

# use -it for debug purpose, -d for daemon
OPT=-d

c=`docker ps|grep farmbot-web-app|awk '{print $NF;exit}'`
if [ "$c" != "" ]; then
	docker stop $c
fi

case $1 in
	"init")
		docker run $OPT \
			-p "3000:3000" \
			-p "3808:3808" \
			-e "HOSTIP=$HOSTIP" \
			-e "PGHOST=$PGHOST" \
			-e "PGPORT=$PGPORT" \
			-e "PGUSER=$PGUSER" \
			-e "PGPASS=$PGPASS" \
			-e "PGDBNAME=$PGDBNAME" \
			cyriacr/farmbot-web-app \
			/start.sh init
		;;
	"run")
		docker run $OPT \
			-p "3000:3000" \
			-p "3808:3808" \
			-e "HOSTIP=$HOSTIP" \
			-e "PGHOST=$PGHOST" \
			-e "PGPORT=$PGPORT" \
			-e "PGUSER=$PGUSER" \
			-e "PGPASS=$PGPASS" \
			-e "PGDBNAME=$PGDBNAME" \
			cyriacr/farmbot-web-app \
			/start.sh
		;;
	*)
		echo "Usage: $0 init|run"
		echo "	use 'init' for the very first time or if you want to rebuild the database"
		echo "	use 'run' for after first time"
		;;
esac

