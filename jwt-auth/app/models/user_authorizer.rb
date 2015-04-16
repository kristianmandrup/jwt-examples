class UserAuthorizer

  attr_reader :email, :password

  def initialize email, password
    @email, @password = [email, password]
  end

  def authorize(auth_type)
    valid_auth?(auth_type) ? TokenResponder.new(user).valid_token : TokenResponder.new(user).invalid_token
  end

  def user_for_auth_type(auth_type)
    if auth_type == 1
      User.find_or_create_by(email: email, password_hash: password)
    else
      User.find_by(email: email, password_hash: password)
    end
  end

  def user
    @user
  end

  def valid_auth? auth_type
    @user = user_for_auth_type(auth_type)
    auth_type == 1 || user.present?
  end

end