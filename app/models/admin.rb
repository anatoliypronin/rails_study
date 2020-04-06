class Admin < ApplicationRecord
  validates :name, :email, :password_digest, :role, :state, presence: true
  validates :name, length: { in: 2..20 }
  validates :email, uniqueness: true, email: true
  validates :password_digest, length: { in: 4..12 }
  validates :role, inclusion: { in: %w(admin editor),
    message: `%{value} must be admin or editor` }
  validates :state, inclusion: { in: %w(active deleted),
    message: `%{value} must be active or deleted` }
end
