class Style < ApplicationRecord
  has_many :beers
  validates :name, presence: true
  validates :name, length: { minimum: 3 }
end
