FROM ruby:2.4.1-slim-stretch

RUN apt-get update && apt-get install -y build-essential mysql-client git default-libmysqlclient-dev curl gnupg2
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash
RUN apt-get install -y nodejs

ENV INSTALL_PATH /thermostat
ENV RAILS_ENV production

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile
RUN bundle install

COPY . .

RUN bundle exec rake assets:precompile

VOLUME ["$INSTALL_PATH/public"]

CMD bundle exec puma -C config/puma.rb
