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

# Install FarmBot Web App
WORKDIR /opt
RUN git clone https://github.com/FarmBot/Farmbot-Web-App --depth=10

WORKDIR /opt/Farmbot-Web-App
RUN gem install bundler
RUN npm install yarn 
RUN bundle install 
RUN yarn install

ADD database.yml config/database.yml    
ADD application.yml config/application.yml

ADD start.sh /start.sh
RUN chmod +x /start.sh

