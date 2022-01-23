class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  # return auth token once user is authenticated
  def authenticate
    auth_hash =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_hash)
  end

  private

  def auth_params
    params.require(:user).permit(:email, :password)
  end
end
