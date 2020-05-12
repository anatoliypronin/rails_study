class Profession < ApplicationRecord
  include ProfessionRepository

  has_many :course_professions, dependent: :nullify
  has_many :courses, through: :course_professions

  validates :title, :description, :state, presence: true
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
