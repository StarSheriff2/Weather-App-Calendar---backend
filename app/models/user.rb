class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :reminders, dependent: :destroy, foreign_key: :created_by
  # Validations
  validates :name, presence: true, length: { minimum: 6, maximum: 24 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 24 }
  validates :password_digest, presence: true, length: { maximum: 24 }
end
