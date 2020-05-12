class Lesson < ApplicationRecord
  belongs_to :course:student_homeworks
  has_many :course
  
  validates :title, :description, :homework, :state, presence: true
  validates :title, length: { maximum: 50 }

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
