class Review < ApplicationRecord
  belongs_to :restaurant # builds a method review.restaurant
  validates :content, presence: true
end
