class RemoveColumnsFromBeer < ActiveRecord::Migration[5.1]
  def change
    remove_column :beers, :style, :integer
  end
end
