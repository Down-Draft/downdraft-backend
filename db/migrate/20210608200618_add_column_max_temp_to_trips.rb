class AddColumnMaxTempToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :max_temperature, :float
  end
end
