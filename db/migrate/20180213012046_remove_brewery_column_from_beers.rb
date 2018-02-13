class RemoveBreweryColumnFromBeers < ActiveRecord::Migration[5.1]
  def change
    remove_column :beers, :bewery_id, :integer
  end
end
