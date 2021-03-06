class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/
  # encrypt password
  has_secure_password

  # Model associations
  has_many :reminders, dependent: :destroy, foreign_key: :created_by
  # Validations
  validates :name, presence: true, length: { maximum: 35 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, length: { maximum: 65 }, uniqueness: true
  validates :password_digest, presence: true
end
