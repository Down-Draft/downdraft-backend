class CreateTripBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_beers do |t|
      t.references :beer, foreign_key: true
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
