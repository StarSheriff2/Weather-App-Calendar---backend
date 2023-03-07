# frozen_string_literal: true

require 'dotenv'
Dotenv.load

Healthcheck.configure do |config|
  config.success = 200
  config.error = 503
  config.verbose = true
  config.route = '/healthcheck'
  config.method = :get

  # -- Checks --
  config.add_check :database,     -> { ActiveRecord::Base.connection.execute('SELECT 1') }
  config.add_check :migrations,   -> { ActiveRecord::Migration.check_pending! }
  config.add_check :environments, -> { Dotenv.require_keys('DATABASE_URL', 'RAILS_MASTER_KEY', 'SECRET_KEY_BASE') unless ENV['RAILS_ENV'] == 'production' }
end
