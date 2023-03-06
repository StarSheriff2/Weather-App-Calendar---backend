# syntax=docker/dockerfile:1

FROM ruby:3.0.2
RUN apt-get update -qq && apt-get install -y postgresql-client
ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
ENV DATABASE_URL postgres://arturoalvarezv:LeHDI3mAN2MCVE7IHSu2OTSW3XcXkSes@dpg-cg2dnse4dada1e10sg90-a/weather_app_calendar_db
# ENV DATABASE_HOSTNAME postgres
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle config set --local without 'development test'
RUN bundle install
COPY . .
COPY entrypoint.sh /usr/bin/
# COPY render-build.sh /usr/bin/
# RUN chmod +x /usr/bin/render-build.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3001
# CMD ["rails", "server", "-b", "0.0.0.0"]
