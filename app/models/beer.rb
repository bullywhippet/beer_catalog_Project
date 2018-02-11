class Beer < ApplicationRecord
  validates :name, presence: true
  validates :country, length: { minimum: 3 }
end
