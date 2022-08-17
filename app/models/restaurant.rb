class Restaurant < ApplicationRecord
  # Associations
  has_many :reviews # builds a method for us -> daniel.reviews
  belongs_to :user

  # Validations
  validates :name, presence: true
  validates :address, presence: true

  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
