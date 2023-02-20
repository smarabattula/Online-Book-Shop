class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :Rating, presence: true, inclusion: { in: 1..5 } #Review Ranges from 1 to 5
  validates :Review, presence: true

end
