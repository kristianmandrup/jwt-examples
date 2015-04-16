class User < ActiveRecord::Base
  has_many :posts

  def self.authorize(email,password,auth_type)
    UserAuthorizer.new(email, password).authorize(auth_type)
  end

end


