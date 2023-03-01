FROM ruby:3.0.2
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN bin/rails db:setup
COPY . .
CMD ["rails", "server"]
EXPOSE 3001
