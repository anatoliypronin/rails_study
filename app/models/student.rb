class Student < ApplicationRecord
  validates :first_name, :last_name, :email, :phone_number,
            :state, presence: true
  validates :first_name, :last_name, length: { maximum: 50 }
  validates :phone_number, uniqueness: true, phone: true
  validates :email, email: true

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
