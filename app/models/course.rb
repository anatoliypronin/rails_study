class Course < ApplicationRecord
  validates :title, :description, :state, presence: true
  validates :title, length: { maximum: 50 }
  validates :state, inclusion: { in: %w[active deleted],
                                 message: `%{value} must be active or deleted` }
end
