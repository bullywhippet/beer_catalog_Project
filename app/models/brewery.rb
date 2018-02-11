class Brewery < ApplicationRecord
  validates :name, presence: true
  validates :country, length: { minimum: 3 }
  validates :name, uniqueness: true
end
