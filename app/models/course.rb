class Course < ApplicationRecord
  validates :title, :description, :state, presence: true
  validates :title, length: { maximum: 50 }
  validates :state, inclusion: { in: %w[active deleted],
                                 message: `%{value} must be active or deleted` }

  has_many :student_courses, dependent: :destroy
  has_many :students, through: :student_courses
  has_many :reviews, dependent: :destroy
  has_many :students, through: :reviews
end
