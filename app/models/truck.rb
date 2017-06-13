class Truck < ApplicationRecord
  attr_accessor :address, :latitude, :longitude, :location
  # One to MANY: User > Trucks
  belongs_to :user, optional: true

  geocoded_by :location
  after_validation :geocode
end
