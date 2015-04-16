class HomeController < ApplicationController
  skip_before_action :authenticate_request # this will be implemented later
  def index
    redirect_to posts_path if @current_user
  end

  def logout
    @current_user = session[:token] = nil
    redirect_to root_path
  end
end