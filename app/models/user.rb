class User < ApplicationRecord
  has_secure_password
  has_many :transactions
  has_many :books
  has_many :reviews
  validates :username, presence: true, uniqueness: true
end
