class Course < ApplicationRecord

  belongs_to :teacher, optional: true

  validates :title, :description, :state, presence: true
  validates :title, length: { maximum: 50 }

  has_many :student_courses, dependent: :destroy
  has_many :students, through: :student_courses

  state_machine initial: :active do
    state :active
    state :deleted

    event :del do
      transition active: :deleted
    end

    event :restore do
      transition deleted: :active
    end
  end
end
