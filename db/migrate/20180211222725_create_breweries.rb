class CreateBreweries < ActiveRecord::Migration[5.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
