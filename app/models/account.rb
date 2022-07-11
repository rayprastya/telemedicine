class Account < ApplicationRecord
  # adds virtual attributes for authentication
  has_one :user
  has_one :doctor
  
  # validates email
  validates :username, presence: true, uniqueness: true
  # validates :username, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid username' }
end
