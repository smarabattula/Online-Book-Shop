class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :Rating, presence: true, inclusion: { in: 1..5 }
  validates :Review, presence: true, length: { maximum: 1000, message: "is too long (maximum is 1000 characters)" }

end
