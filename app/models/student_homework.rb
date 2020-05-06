class StudentHomework < ApplicationRecord
  belongs_to :student
  # belongs_to :lesson
  validates :raiting, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  # validates :student_comment
  # validates :teacher_comment
  validates :date_begin, presence: true
  validates :date_end, presence: true
  validates :link_homework, presence: true, url: true
  # validates :student, uniqueness: { scope: :lesson }
  state_machine initial: :recived do
    state :recived
    state :doing
    state :checking
    state :accepted

    event :begin do
      transition recived: :doing
    end

    event :testing do
      transition doing: :checking
    end

    event :modify do
      transition checking: :doing
    end

    event :done do
      transition checking: :accepted
    end
  end
end