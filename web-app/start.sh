#!/bin/bash

cd /opt/Farmbot-Web-App
set -e
secret=`rake secret`

# for official, not working right now
# sed -i s/changeme-io/$HOSTIP/g /etc/nginx/sites-enabled/farmbot.conf

sed -i s/changeme-io/$HOSTIP/g config/application.yml

sed -i s/localhost/$HOSTIP/g app/models/transport.rb
sed -i s/localhost/$HOSTIP/g config/webpack.dev.js

sed -i s/pgsql-host/$PGHOST/g config/application.yml
sed -i s/pgsql-port/$PGPORT/g config/application.yml
sed -i s/pgsql-user/$PGUSER/g config/application.yml
sed -i s/pgsql-pass/$PGPASS/g config/application.yml
sed -i s/pgsql-dbname/$PGDBNAME/g config/application.yml

sed -i s/pgsql-host/$PGHOST/g config/database.yml
sed -i s/pgsql-port/$PGPORT/g config/database.yml
sed -i s/pgsql-user/$PGUSER/g config/database.yml
sed -i s/pgsql-pass/$PGPASS/g config/database.yml
sed -i s/pgsql-dbname/$PGDBNAME/g config/database.yml


RAILS_ENV=test
if [ "$1" = "init" ]; then
	rake db:create db:migrate db:seed
fi

rails api:start

# for official, not working right now
#rails server -p 3000 -b 0.0.0.0
#service nginx restart
