class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, confirmation: true
  validates :username, uniqueness: true, presence: true

  enum role:[:default, :admin]
end
