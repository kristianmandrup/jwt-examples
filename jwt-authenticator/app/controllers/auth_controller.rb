class AuthController < ApplicationController
  skip_before_action :authenticate_request # this will be implemented later
  def authenticate
    user = User.find_by(user_params) # you'll need to implement this
    if user
      token = session[:token] = user.generate_auth_token
      redirect_to posts_path
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private
    def user_params
      { username: params[:username], password: params[:password]}
    end
end