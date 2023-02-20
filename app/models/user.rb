class User < ApplicationRecord
  has_secure_password
  has_many :transactions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :credit_card_number, presence: true, length: { minimum: 16 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :address, presence: true
  validates :phone_number, presence: true, length: { minimum: 10 }

end

