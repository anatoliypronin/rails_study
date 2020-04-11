class Profession < ApplicationRecord
  validates :title, :description, :state, presence: true
  validates :title, length: { maximum: 50 }
  validates :state, inclusion: { in: %w[active deleted],
                                 message: '%{value} is not a valid state' }
end
