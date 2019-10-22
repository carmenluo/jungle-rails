class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, confirmation: true, length: {minimum: 6, maximum: 10}
  validates :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  private
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if (user) && user.authenticate(password)
      user
    else
      nil
    end
  end
end
