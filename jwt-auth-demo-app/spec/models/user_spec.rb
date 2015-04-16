require 'rails_helper'

describe User do

  describe 'Associations' do
    it{should have_many(:posts)}
  end

  describe 'Class methods' do

    before do
      @user = FactoryGirl.create(:user)
    end
    
    describe 'authorize' do
      it 'creates a new user for auth_type=1 and returns a valid auth token' do
        auth_data = User.authorize('user@test.com', '123456789', 1)
        expect(auth_data).to be_a(Hash)
        expect(auth_data).to include('username' => 'user@test.com')
      end

      it 'authorizes an existing user for given email-pwd and returns an auth token for authenticated user' do
        auth_data = User.authorize(@user.email, '123456789', 0)
        expect(auth_data).to be_a(Hash)
        expect(auth_data).to include('username' => @user.email)
      end

      it 'returns error message for invalid email-pwd' do
        auth_data = User.authorize(@user.email, 'abcdef', 0)
        expect(auth_data).to be_a(Hash)
        expect(auth_data).to include(:message => "Invalid Username/Password")
      end
    end

  end
  
end