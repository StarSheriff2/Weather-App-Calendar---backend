FROM ruby:3.0.2
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install
COPY . .
RUN bundle exec rake db:setup
CMD ["rails", "server"]
EXPOSE 3001
