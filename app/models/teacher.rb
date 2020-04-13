class Teacher < ApplicationRecord
  validates :first_name, :last_name, :email, :password_digest,
            presence: true
  validates :first_name, :last_name, length: { maximum: 50 }
  validates :email, email: true, uniqueness: true

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
