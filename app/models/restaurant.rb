class Restaurant < ApplicationRecord
  # Associations
  has_many :reviews # builds a method for us -> daniel.reviews
  belongs_to :user

  # Validations
  validates :name, presence: true
  validates :address, presence: true
end
