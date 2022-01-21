class Reminder < ApplicationRecord
  # validations
  validates_presence_of :description, :datetime, :city, :location_coordinates
end
