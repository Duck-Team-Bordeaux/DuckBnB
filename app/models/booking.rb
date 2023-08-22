class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :ducks
end
