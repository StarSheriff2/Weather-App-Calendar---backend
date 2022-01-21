class V2::RemindersController < ApplicationController
  def index
    json_response({ message: 'Hello there' })
  end
end
