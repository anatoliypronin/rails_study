class Lesson < ApplicationRecord
  belongs_to :course

  has_many :student_homeworks, dependent: :destroy
  has_many :students, through: :student_homeworks

  validates :title, :description, :homework, :state, presence: true
  validates :title, length: { maximum: 50 }, uniqueness: true

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
