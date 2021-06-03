class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.date :date
      t.float :elevation
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
