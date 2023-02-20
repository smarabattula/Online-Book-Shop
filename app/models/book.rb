class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :transactions, dependent: :destroy
  validates :Name, presence: true
  validates :Author, presence: true
  validates :Publisher, presence: true
  validates :Price, presence: true
  validates :Stock, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
