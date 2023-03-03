# syntax=docker/dockerfile:1

FROM ruby:3.0.2
RUN apt-get update -qq && apt-get install -y postgresql-client
ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle config set --local without 'development test'
RUN bundle install
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
COPY . .
# RUN bash -c bundle exec rake DATABASE_URL=postgres:does_not_exist
RUN bash -c bundle exec rake SECRET_KEY_BASE=d4df6d90bb36b2b3c1f0e19592fa183c22846512b87cdb148f41fe67eb6901c48e467dde1038da7820bed13f45a3030feef92df121a772954de2bd36596b34bf
RUN bash -c bundle exec rake RAILS_MASTER_KEY=d20ad351b961025e89204f525ae5adb9
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3001
CMD ["rails", "server", "-b", "0.0.0.0"]
