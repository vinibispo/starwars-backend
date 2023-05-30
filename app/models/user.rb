class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true

  required :email, :name, :password

  validates :password, length: { minimum: 6 }
end
