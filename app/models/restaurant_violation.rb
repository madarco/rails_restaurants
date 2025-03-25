class RestaurantViolation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :inspection_type
  belongs_to :violation_type

  validates :inspection_score, presence: true
  validates :inspection_date, presence: true
  validates :violation_date, presence: true
  validates :violation_type, presence: true
end
