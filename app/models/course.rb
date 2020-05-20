class Course < ApplicationRecord
  validates :title, :description, :state, presence: true
  validates :title, length: { maximum: 50 }, uniqueness: true

  has_many :student_courses, dependent: :destroy
  has_many :students, through: :student_courses
  has_many :reviews, dependent: :destroy
  has_many :students, through: :reviews

  belongs_to :teacher, optional: true

  has_many :lessons, dependent: :destroy
  has_many :course_professions, dependent: :nullify
  has_many :professions, through: :course_professions

  state_machine initial: :active do
    state :active
    state :deleted

    event :del do
      transition from: :active, to: :deleted, if: :active?
    end

    event :restore do
      transition from: :deleted, to: :active, if: :deleted?
    end
  end
end
