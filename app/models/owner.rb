class Owner < ApplicationRecord
  has_many :restaurants
  has_many :restaurant_violations, through: :restaurants

  validates :name, presence: true
  validates :state, length: { is: 2 }
end
