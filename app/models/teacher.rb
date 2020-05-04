class Teacher < ApplicationRecord
  has_many :courses, dependent: :nullify

  validates :first_name, :last_name, :email,
            presence: true
  validates :first_name, :last_name, length: { maximum: 50 }
  validates :email, email: true, uniqueness: true

  has_secure_password

  state_machine initial: :active do
    state :active
    state :deleted

    event :del do
      transition from: :active, to: :deleted, if: :active?
    end

    event :restore do
      transition from: :deleted, to: :active, if: :deleted?
    end
  end
end
