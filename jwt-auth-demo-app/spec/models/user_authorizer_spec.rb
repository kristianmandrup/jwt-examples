require 'rails_helper'

describe UserAuthorizer do

  describe 'methods' do

    before do
      @token_user = FactoryGirl.create(:user)
      @user_authorizer = UserAuthorizer.new(@token_user.email, @token_user.password_hash)
    end

    describe 'authorize' do
      it 'returns valid token for auth_type 1 for given email and password' do
        user_authorizer2 = UserAuthorizer.new('user@test.com', '123456789')
        expect(user_authorizer2.authorize(1)).to include({'username' =>  'user@test.com'})
      end

      it 'returns valid token for auth_type other than 1 and for valid email and password' do
        expect(@user_authorizer.authorize(0)).to include({'username' => @token_user.email})
      end

      it 'returns invalid token has for auth_type other than 1 and invalid email/password' do
        user_authorizer2 = UserAuthorizer.new(@token_user.email, '123456')
        expect(user_authorizer2.authorize(0)).to eq({:message => "Invalid Username/Password"})
      end
    end

    describe 'user_for_auth_type' do
      it 'finds user object with matching email and password for auth_type = 1' do
        expect(@user_authorizer.user_for_auth_type(1)).to eq(@token_user)
      end

      it 'finds or creates a new user object with given email and password for auth_type = 1' do
        user_authorizer2 = UserAuthorizer.new('user@test.com', '123456789')
        expect(user_authorizer2.user_for_auth_type(1)).to be_a(User)
      end

      it 'finds a user object with matching email and pwd for auth_type other than 1' do
        expect(@user_authorizer.user_for_auth_type(0)).to eq(@token_user)
      end

      it 'returns nil or auth_type other than 1 when user with email and password doesnt exist in DB' do
        user_authorizer2 = UserAuthorizer.new('user@test.com', '123456789')
        expect(user_authorizer2.user_for_auth_type(0)).to be_nil
      end
    end

    describe 'user' do
      it 'returns appropriate user object' do
        @user_authorizer.valid_auth?(1)
        expect(@user_authorizer.user).to eq(@token_user)
      end
    end

    describe 'valid_auth?' do
      it 'returns true for given email and password for auth_type 1' do
        user_authorizer2 = UserAuthorizer.new('user@test.com', '123456789')
        expect(user_authorizer2.valid_auth?(1)).to be_truthy
      end

      it 'returns true if user with given email and password exists in DB for auth_type other than 1' do
        expect(@user_authorizer.valid_auth?(0)).to be_truthy
      end

      it 'returns false if user with given email and password does not exist in DB fo auth_type other than 1' do
        user_authorizer2 = UserAuthorizer.new(@token_user.email, '123456')
        expect(user_authorizer2.valid_auth?(0)).to be_falsey
      end
    end


  end

end