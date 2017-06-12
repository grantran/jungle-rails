class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true 
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true, presence: true, length: {minimum: 3}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    stripped_email = email.strip.downcase
    user = User.find_by_email(stripped_email)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      user
    else
      return nil
    end
   end
end
