class AddLatitudeAndLongitudeToTruck < ActiveRecord::Migration[5.1]
  def change
    add_column :trucks, :latitude, :float
    add_column :trucks, :longitude, :float
  end
end
