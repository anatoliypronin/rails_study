class Student < ApplicationRecord
  validates :first_name, :last_name, :email, :phone_number,
            :state, presence: true
  validates :first_name, :last_name, length: { maximum: 50 }
  validates :phone_number, uniqueness: true, phone: true
  validates :email, email: true
  validates :state, inclusion: { in: %w(active deleted),
            message: `%{value} must be active or deleted` }
end
