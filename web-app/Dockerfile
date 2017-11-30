FROM ruby:2.4.2

RUN apt-get install -y git curl imagemagick # apt-utils

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get -y install yarn

# Install database deps
RUN apt-get install -y libpq-dev # postgresql-contrib

# RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
# RUN apt-get install -y apt-transport-https ca-certificates

# Add our APT repository
# RUN sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'
# RUN apt-get update -y

# Install Passenger + Nginx
# RUN apt-get install -y nginx-extras passenger

# ADD farmbot.conf /etc/nginx/sites-enabled/farmbot.conf

# Install FarmBot Web App
WORKDIR /opt
RUN git clone https://github.com/FarmBot/Farmbot-Web-App --depth=10

WORKDIR /opt/Farmbot-Web-App
RUN gem install bundler
RUN npm install yarn 
RUN bundle install 
RUN yarn install

# ADD database.build.yml config/database.yml
# ADD application.build.yml config/application.yml
# RUN bundle install --deployment --without test development
# RUN RAILS_ENV=production bundle exec rake assets:precompile

# ADD forbuild.sh /forbuild.sh
# RUN chmod +x /forbuild.sh
# RUN /forbuild.sh

ADD database.yml config/database.yml    
ADD application.yml config/application.yml

# create database
# RUN rake db:create:all db:migrate db:seed

ADD start.sh /start.sh
RUN chmod +x /start.sh
