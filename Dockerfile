# syntax=docker/dockerfile:1

FROM ruby:3.0.2
# RUN apt-get update -qq && apt-get install -y postgresql-client
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install
COPY . .
