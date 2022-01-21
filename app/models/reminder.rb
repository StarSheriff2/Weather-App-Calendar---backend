class Reminder < ApplicationRecord
  # validations
  validates :description, presence: true, length: { maximum: 30, too_long: 'Too long. Maximum is 30 characters.' }
  validates :datetime, presence: true
  validates :city, presence: true, length: { maximum: 60 }
  validates :location_coordinates, presence: true, length: { maximum: 100 }
  validates :created_by, presence: true
end
