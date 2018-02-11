class Beer < ApplicationRecord
  validates :name, :style_id, presence: true
  validates :abv, numericality: true
  validates :name, uniqueness: true
end
