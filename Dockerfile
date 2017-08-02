FROM ruby:2.4.1
RUN apt-get update -y && apt-get install -y apt-utils
RUN apt-get install -y wget build-essential libpq-dev libssl-dev libffi-dev python-dev libc6-dev apt-transport-https

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -y && apt-get install -y yarn

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN mkdir /soolbarweek
ADD Gemfile /soolbarweek/Gemfile
ADD Gemfile.lock /soolbarweek/Gemfile.lock
RUN cd /soolbarweek && bundle install
ADD . /soolbarweek