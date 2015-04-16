require 'rails_helper'

describe TokenValidator do
  describe 'methods' do
    before do
      @token_user = FactoryGirl.create(:user)
      @token = User.authorize(@token_user.email, @token_user.password_hash, 1)['token']
      @token_validator = TokenValidator.new(@token)
    end

    describe 'initialize' do
      it 'returns a TokenValidator object for a valid token' do
        expect(TokenValidator.new(@token)).to be_a(TokenValidator)
      end

      it 'raises an exception for an invalid token' do
        expect{TokenValidator.new('random_token')}.to raise_error('Failed to initialize. Invalid token!')
      end
    end

    describe 'valid_jwt_token?' do
      it 'returns true for valid jwt token' do
        expect(@token_validator.valid_jwt_token?).to be_truthy
      end
    end

    describe 'user_identifier' do
      it 'returns user email for a valid token' do
        expect(@token_validator.user_identifier).to eq(@token_user.email)
      end
    end

    describe 'token_identifier' do
      it 'returns user email for a valid token' do
        expect(@token_validator.token_identifier).to eq(@token_user.email)
      end
    end

    describe 'user' do
      it 'returns appropriate user object for a valid token' do
        expect(@token_validator.user).to eq(@token_user)
      end
    end

    describe 'user_id' do
      it 'returns id of appropriate user for a valid token' do
        expect(@token_validator.user_id).to eq(@token_user.id)
      end
    end

    describe 'decoded_data' do
      it 'returns decoded user data for valid token' do
        expect(@token_validator.decoded_data).to eq([
          {"#{@token_user.id}" => @token_user.email},
          {"typ" => "JWT", "alg" => "HS256"}
        ])
      end
    end
  end
end