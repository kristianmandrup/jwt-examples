require 'rails_helper'

describe Api::PostsController do

  before do
    @user = FactoryGirl.create(:user)
    @token = User.authorize(@user.email, '123456789', 0)['token']
  end

  describe 'response of API' do

    before do
      @post = FactoryGirl.create(:post, user_id: @user.id)
      @params = {token: @token}
    end

    describe 'GET#index' do
      it 'returns json of Post data' do
        get :index, @params
        expect(JSON.parse(response.body)).to eq(JSON.parse(@user.posts.to_json))
      end
    end

    describe 'GET#show' do
      it 'returns json data for any particular post' do
        get :show, @params.merge(id: @post.id)
        expect(JSON.parse(response.body)).to eq(JSON.parse(@post.to_json))
      end
    end

    describe 'POST#create' do
      before do
        @params.merge!(post: FactoryGirl.attributes_for(:post, title: 'New Post', user_id: @user.id))
      end

      it 'inserts a new post record into the DB' do
        expect{
          post :create, @params
        }.to change(Post, :count).by(1)
      end

      it 'returns json data of created post' do
        post :create, @params
        expect(JSON.parse(response.body)).to include('title' => 'New Post', 'user_id' => @user.id)
      end
    end

    describe 'PUT#update' do
      before do
        post = FactoryGirl.create(:post)
        @params.merge!(post: FactoryGirl.attributes_for(:post, title: 'Edited Post'), id: post.id)
      end

      it 'updates post data in DB' do
        put :update, @params
        expect(Post.last.title).to eq('Edited Post')
      end

      it 'returns json data of updated post' do
        put :update, @params
        expect(JSON.parse(response.body)).to include('title' => 'Edited Post')
      end
    end

    describe 'DELETE#destroy' do
      it 'deletes a post from the DB' do
        expect{
          delete :destroy, @params.merge(id: @post.id)
        }.to change(Post, :count).by(-1)
      end

      it 'returns json data of deleted post' do
        delete :destroy, @params.merge(id: @post.id)
        expect(JSON.parse(response.body)).to eq(JSON.parse(@post.to_json))
      end
    end
  end

end