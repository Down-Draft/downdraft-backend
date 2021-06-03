class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.bigint :brewery_id
      t.string :name
      t.float :abv
      t.string :description
      t.references :style, foreign_key: true

      t.timestamps
    end
  end
end
