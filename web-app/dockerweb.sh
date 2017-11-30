#!/bin/bash

IP=`ip route get 8.8.8.8|awk '{print $NF; exit;}'`
docker stop farmbot-web-app

case $1 in
	"init")
		docker run \
			-p "3000:3000" \
			-e "HOSTIP=$IP" \
			-e "PGHOST=$IP" \
			-e "PGPORT=5432" \
			-e "PGUSER=postgres" \
			-e "PGPASS=postgres1234" \
			-e "PGDBNAME=farmbot" \
			cyriacr/farmbot-web-app \
			/start.sh init
		;;
	"run")
		docker run \
			-p "3000:3000" \
			-e "HOSTIP=$IP" \
			-e "PGHOST=$IP" \
			-e "PGPORT=5432" \
			-e "PGUSER=postgres" \
			-e "PGPASS=postgres1234" \
			-e "PGDBNAME=farmbot" \
			cyriacr/farmbot-web-app \
			/start.sh
		;;
	*)
		echo "Usage: $0 init|run"
		;;
esac

