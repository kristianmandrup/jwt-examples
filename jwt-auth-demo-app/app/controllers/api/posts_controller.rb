class Api::PostsController < ApplicationController
  include JwtAuth::Authorizer
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_valid_tokens, :except => [:authorize]
  before_action :set_user, only: [:index, :create]
  
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
   render json: user_params? ? User.authorize(auth_params) : message
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
      [:email, :password].all? {|name| param? name }
    end

    def param? name
      params[name].present?
    end

    def auth_params
      {email: params[:email], password_hash: params[:password]} if user_params?
    end

    def message
      { "message" => "Invalid Credentials" }
    end

    def set_user
      @user = token_validator.user
    end
end