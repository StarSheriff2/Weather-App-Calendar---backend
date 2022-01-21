require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Reminder, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:datetime) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:location_coordinates) }
  it { should validate_presence_of(:created_by) }
end
