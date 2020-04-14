class Profession < ApplicationRecord

  has_many :course_profession, dependent: :nullify
  has_many :course, through: :course_profession
  
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
