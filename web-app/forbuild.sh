#!/bin/bash
# awk '{print "env PATH;" $0 }' /etc/nginx/nginx.conf 
# echo "include /etc/nginx/passenger.conf;" >> /etc/nginx/nginx.conf

sed -i s/changeme-io/192.168.1.1/g config/application.yml
secret=`rake secret`
sed -i s/rake-secret/$secret/g config/application.yml
