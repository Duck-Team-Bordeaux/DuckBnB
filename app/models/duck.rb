class Duck < ApplicationRecord
  has_many :bookings
  has_many :favorites
  belongs_to :user

  geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?

  validates :name, :description, :url, :price, :category, presence: true
  validates :name, uniqueness: true
end
