class Review < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :body, presence: true
  validates :student, uniqueness: { scope: :course }
end
