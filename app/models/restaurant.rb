class Restaurant < ApplicationRecord
  belongs_to :owner
  has_many :restaurant_violations

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
end
