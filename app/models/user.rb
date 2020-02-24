class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :first_name, presence: true, length: { minimum: 3, maximum: 15}
  validates :last_name, presence: true, length: { minimum: 3, maximum: 15}
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true

  has_secure_password
end
