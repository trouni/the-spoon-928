class Review < ApplicationRecord
  belongs_to :restaurant # builds a method review.restaurant
  belongs_to :user
  validates :content, presence: true
end
