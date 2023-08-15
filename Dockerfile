FROM ruby:2.7.0
LABEL authors="Wagner Rigoli da Rosa"

RUN apt-get update &&  \
    apt-get install -y npm &&  \
    npm install -g yarn &&  \
    gem install bundler:2.1.2

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN bundle install

EXPOSE 3000

CMD rails s -b 0.0.0.0
