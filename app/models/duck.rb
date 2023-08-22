class Duck < ApplicationRecord
  has_many :bookings
  has_many :favorites
end
