class Profession < ApplicationRecord
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
