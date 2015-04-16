require 'rails_helper'

describe TokenResponder do

  describe 'methods' do
    before do
      @token_user = FactoryGirl.create(:user)
      @token_responder = TokenResponder.new(@token_user)
    end

    describe 'invalid_token' do
      it 'returns invalid token hash' do
        expect(@token_responder.invalid_token).to eq({:message => "Invalid Username/Password"})
      end
    end

    describe 'user_token' do
      it 'returns a token hash' do
        expect(@token_responder.user_token).to include({'username' => @token_user.email})
      end
    end

    describe 'valid_token' do
      it 'returns token hash for the user' do
        expect(@token_responder.valid_token).to include({'username' => @token_user.email})
      end
    end

    describe 'generate_valid_tokens' do
      it 'returns a valid token string for a given user' do
        expect(@token_responder.generate_valid_tokens(@token_user)).to be_a(String)
      end
    end

    describe 'user_data' do
      it 'returns a Hash containing user data' do
        expect(@token_responder.user_data).to eq(
          {"#{@token_user.id}" => @token_user.email}
        )
      end
    end
  end

end