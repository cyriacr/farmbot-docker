# farmbot-docker


## Please check runweb.sh and runmqtt.sh before execute them. ##


# SERVICES START SEQUENCE #

Start PostgreSQL first.
Then runweb.sh
Wait for 60-180 seconds, depanding on your CPU power.
Run runmqtt.sh.

# PostgreSQL #

For data preservation, PostgreSQL is not installed in both dockerfiles. 

Please install you PostgreSQL as services. 

After you install PostgreSQL, run the following commands to create user and password for Farmbot.

		sudo -u postgres psql
		CREATE USER farmbot WITH SUPERUSER;
		alter user farmbot with password 'farmbot1234';

In my example, I use "farmbot" as my postgreSQL username, and "farmbot1234" as password. Please change them to your own settings.

Also you need to add your network to pg_hba.conf, for example:

		host    all             all             192.168.0.0/16 		trust
		host    all             all             10.0.0.0/8		trust

Find the following line in postgresql.conf,

		listen_addresses = 'localhost' 

and change it to

		listen_addresses = '*' 





