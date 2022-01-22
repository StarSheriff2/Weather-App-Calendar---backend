# spec/models/user_spec.rb
require 'rails_helper'

# Test suite for User model
RSpec.describe User, type: :model do
  # Association test
  it { should have_many(:reminders).dependent(:destroy) }
  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should allow_value('test_user@email.com').for(:email) }
  it { should_not allow_value('test_user@email').for(:email) }
  it { should validate_presence_of(:password_digest) }
end
