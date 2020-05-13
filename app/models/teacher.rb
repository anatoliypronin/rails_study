class Teacher < ApplicationRecord
  has_many :courses, dependent: :nullify
  has_many :articles, dependent: :nullify

  validates :first_name, :last_name, :email,
            presence: true
  validates :first_name, :last_name, length: { maximum: 50 }
  validates :email, uniqueness: true, email: true

  has_secure_password

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
