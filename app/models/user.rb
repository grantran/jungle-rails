class User < ActiveRecord::Base
  has_secure_password

  # add validations
end
