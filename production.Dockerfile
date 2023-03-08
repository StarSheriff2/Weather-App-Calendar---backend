# syntax=docker/dockerfile:1

FROM ruby:3.0.2
RUN apt-get update -qq && apt-get install -y postgresql-client
ENV BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3 \
  RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT true
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem update --system && gem install bundler
# RUN bundle config set --local without 'development test'
# RUN bundle install
RUN bundle config jobs 4 \
  && bundle config set --local without 'development test' \
  && bundle install
COPY . .
COPY production.entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/production.entrypoint.sh
ENTRYPOINT ["production.entrypoint.sh"]
EXPOSE 3001
CMD ["rails", "server", "-b", "0.0.0.0"]
