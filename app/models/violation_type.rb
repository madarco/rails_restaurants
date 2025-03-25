class ViolationType < ApplicationRecord
  has_many :restaurant_violations

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :risk_category, presence: true
end
