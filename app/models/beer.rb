class Beer < ApplicationRecord
  belongs_to :style
  belongs_to :brewery
  validates :name, :style_id, presence: true
  validates :abv, numericality: true
  validates :name, uniqueness: true
end
