class AddBreweryRefToBeers < ActiveRecord::Migration[5.1]
  def change
    add_reference :beers, :brewery, foreign_key: true
  end
end
