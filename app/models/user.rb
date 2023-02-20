class User < ApplicationRecord
  has_secure_password
  has_many :transactions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } #Regex validation of email
  validates :password, presence: true, length: { minimum: 6 } #Password Minimum length is 6

end

