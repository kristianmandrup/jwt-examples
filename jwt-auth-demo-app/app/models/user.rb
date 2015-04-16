class User < ActiveRecord::Base
  has_many :posts

  def self.authorize(auth_params)
    jwt_auth = JwtAuth::UserAuthValidator.new(auth_params)
    jwt_auth.get_token
  end
end
