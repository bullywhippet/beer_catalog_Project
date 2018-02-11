class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.text :description
      t.integer :style_id
      t.decimal :abv
      t.integer :bewery_id

      t.timestamps
    end
  end
end
