class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :password, presence: true

  enum role:[:default, :admin]
end
