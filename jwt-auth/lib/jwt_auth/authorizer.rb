module JwtAuth
  module Authorizer
    def authorize_valid_tokens
      render invalid_token unless token_validator.valid_jwt_token?
    end

    protected
      def invalid_token
        {json: {:message => "Invalid Tokens"}}
      end

      def token_validator
       TokenValidator.new(token)
      end

      def token
       params[:token]
      end
  end
end
