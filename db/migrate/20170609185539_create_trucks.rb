class CreateTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :location
      t.string :menu
      t.string :hours

      t.timestamps
    end
  end
end
