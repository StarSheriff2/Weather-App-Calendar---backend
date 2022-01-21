class AuthenticationController < ApplicationController
  # return auth token once user is authenticated
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:user][:email], auth_params[:user][:password]).call
    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.require(:user).permit(:email, :password)
  end
end
