class Truck < ApplicationRecord
  # One to MANY: User > Trucks
  belongs_to :user
end
