class InspectionType < ApplicationRecord
  has_many :restaurant_violations

  validates :name, presence: true, uniqueness: true
end
