# exit on error
set -o errexit

bundle exec rails assets:precompile
bundle exec rails db:prepare
bundle exec rails db:seed

# start the server
exec "$@"
