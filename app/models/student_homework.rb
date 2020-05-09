class StudentHomework < ApplicationRecord
  belongs_to :student
  # belongs_to :lesson
  validates :raiting, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :date_begin, presence: true
  validates :date_end, presence: true
  validates :link_homework, presence: true, url: true
  # validates :student, uniqueness: { scope: :lesson }
  state_machine initial: :doing do
    state :doing
    state :checking
    state :accepted

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