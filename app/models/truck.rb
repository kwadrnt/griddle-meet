class Truck < ApplicationRecord
  # One to MANY: User > Trucks
  belongs_to :user, optional: true

  geocoded_by :location
  after_validation :geocode
end
