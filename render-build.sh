# exit on error
set -o errexit

bundle exec rake assets:precompile
rake db:migrate:reset db:seed

# bundle exec rake db:setup

# start the server
exec "$@"
