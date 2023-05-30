class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true

  required :email, :name

  validates :password, presence: true, length: { minimum: 6 }, if: ->(record) { record.new_record? }
end
