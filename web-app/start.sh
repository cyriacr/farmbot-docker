#!/bin/bash
set -e
secret=`rake secret`
# sed -i s/changeme-io/$HOSTIP/g /etc/nginx/sites-enabled/farmbot.conf

sed -i s/changeme-io/$HOSTIP/g config/application.yml

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

cd /opt/Farmbot-Web-App

RAILS_ENV=test
rake db:create db:migrate db:seed
rails api:start

#rails server -p 3000 -b 0.0.0.0
#service nginx restart
