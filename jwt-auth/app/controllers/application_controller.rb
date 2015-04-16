class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  #Authorize tokens in order to server the posts api
  def authorize_valid_tokens
    render invalid_token unless valid_token?
  end

  private

  # Return invalid token json
  def invalid_token
    {json: {:message => "Invalid Tokens"}}
  end

  # Check if token is valid
  def valid_token?
    token_validator = TokenValidator.new(params[:token])
    @user ||= token_validator.user
    return token_validator.valid_jwt_token?
  end
end
