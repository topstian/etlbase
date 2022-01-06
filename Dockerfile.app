#!/bin/sh

ARG RUBY_VERSION=3.0.3-jemalloc-bullseye-slim
FROM quay.io/evl.ms/fullstaq-ruby:${RUBY_VERSION}
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y libpq-dev
WORKDIR /etlbase
COPY Gemfile /etlbase/Gemfile
COPY Gemfile.lock /etlbase/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /etlbase