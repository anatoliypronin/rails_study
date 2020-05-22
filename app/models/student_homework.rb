class StudentHomework < ApplicationRecord
  belongs_to :student
  belongs_to :lesson
  validates :student, uniqueness: { scope: :lesson }

  validates :raiting, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }, allow_nil: true
  validates :date_begin, presence: true
  validates :link_homework, url: true, allow_nil: true

  state_machine initial: :doing do
    state :doing
    state :checking
    state :accepted

    event :check do
      transition doing: :checking
    end

    event :modify do
      transition checking: :doing
    end

    event :adopted do
      transition checking: :accepted
    end
  end
end
