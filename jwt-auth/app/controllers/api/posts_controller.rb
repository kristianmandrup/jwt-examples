class Api::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_valid_tokens, :except => [:authorize]
  
  # GET /posts.json
  def index
    @posts = Post.where(user_id: @user.id)
    render json: @posts
  end

  # GET /posts/1.json
  def show
    render json: @post
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts.json
  def create
    @post = @user.posts.new(post_params)
    if @post.save
      render json: @post
    else
      render json: @post.errors
    end
  end

  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors
    end
  end

  # DELETE /posts/1.json
  def destroy
    render json: @post.destroy
  end

  def authorize
    render json: auth_response
    # if require_params_present?
    #   @response = User.authorize(params[:email], params[:password], params[:auth_type])
    # else
    #   @response = { "message" => "Invalid Credentials" }
    # end
    # render json: @response
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by_id(params[:id]) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title)
    end

    def user_params?
      [:email, :password, :auth_type].all?{|name| param?(name)}
    end

    def param?(name)
      params[name].present?
    end

    def auth_response
      user_params? ? User.authorize(params[:email], params[:password], params[:auth_type]) : {"message" => "Invalid Credentials"}
    end
end