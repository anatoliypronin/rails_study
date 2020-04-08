# frozen_string_literal: true

class Teacher < ApplicationRecord
  validates :first_name, :last_name, :email, :password_digest,
            :description, :state, presence: true
  validates :first_name, :last_name, length: { maximum: 50 }
  validates :email, email: true
  validates :state, inclusion: { in: %w[active deleted],
                                 message: '%{value} is not a valid state' }
end
