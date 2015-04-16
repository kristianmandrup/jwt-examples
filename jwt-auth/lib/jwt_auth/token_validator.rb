module JwtAuth
  class TokenValidator
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def valid_jwt_token?
      user_identifier == token_identifier if decoded_data.present?
    end

    def user_identifier
      user.email
    end

    def token_identifier
      decoded_data.first[user_id.to_s]
    end

    def user
      @user ||= User.find_by_id(user_id)
    end

    def user_id
      @user_id ||= decoded_data.first.keys.first.to_i
    end

    def decoded_data
      JWT.decode(token, nil, false) rescue ""
    end
  end
end