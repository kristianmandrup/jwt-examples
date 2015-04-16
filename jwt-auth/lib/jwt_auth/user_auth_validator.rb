module JwtAuth
  class UserAuthValidator
    attr_reader :auth_params

    def initialize(auth_params)
      @auth_params = auth_params
    end

    def get_token
      get_token_params if user
    end

    def get_token_params
      { "token" => generate_valid_tokens, "username" => user.email }
    end

    def user
      @user = User.find_or_create_by(auth_params)
    end

    def generate_valid_tokens
      JWT.encode(user_data, "secret")
    end

    def user_data
      { user.id.to_s => user.email.to_s }
    end
  end
end