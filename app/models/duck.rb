class Duck < ApplicationRecord
  has_many :bookings
  has_many :favorites
  belongs_to :user


  validates :name, :description, :url, :price, :category, presence: true
  validates :name, uniqueness: true
end
