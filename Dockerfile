FROM ruby:3.2

LABEL maintainer="me@bigsolom.dev"

# Allow apt to work with https-based sources​
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  apt-transport-https

# Ensure latest packages for Yarn​
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
 tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
 nodejs \
 yarn

# Gem file is copied and bundle install is run before copying the rest of
# the app files since docker is caching an image after each step in Dockerfile
# we don't want any change in files to always re-install the gems
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app

ENV BUNDLE_PATH /gems

RUN bundle install

COPY package.json /usr/src/app/
RUN yarn install --ignore-engines

COPY . /usr/src/app/


CMD [ "bin/rails", "s", "-b", "0.0.0.0" ]