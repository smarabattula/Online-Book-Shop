class Transaction < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :quantity, presence: true
  validates :total_price, presence: true
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :transaction_number, presence: true
  validates :credit_card_number, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

end
