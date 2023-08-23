class Duck < ApplicationRecord
  has_many :bookings
  has_many :favorites
  belongs_to :user
end
