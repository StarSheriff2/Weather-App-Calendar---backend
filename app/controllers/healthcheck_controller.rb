class HealthcheckController < ApplicationController
  skip_before_action :authorize_request, only: :check

  def check
    ActiveRecord::Base.connection_pool.with_connection do |connection|
      result = connection.exec_query('SELECT 1')
      if result.present? && result.rows.first.first == 1
        render json: { status: 'ok' }
      else
        render json: { status: 'error', message: 'Query check failed.' }, status: :service_unavailable
      end
    end
  rescue => e
    render json: { status: 'error', message: e.message }, status: :service_unavailable
  end
end
