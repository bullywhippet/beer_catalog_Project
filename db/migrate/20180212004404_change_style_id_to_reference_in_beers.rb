class ChangeStyleIdToReferenceInBeers < ActiveRecord::Migration[5.1]
  def change
    remove_column :beers, :style_id, :integer
    add_column :beers, :style, :integer, references: :style
  end
end
