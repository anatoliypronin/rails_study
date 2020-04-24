class Admin < ApplicationRecord
  extend Enumerize
  validates :name, :email, :role, :state, presence: true
  validates :name, length: { in: 2..20 }
  validates :email, uniqueness: true, email: true
  validates :password, presence: true, length: { minimum: 2, maximum: 8 }, on: :create

  has_secure_password validations: false

  enumerize :role, in: %i[admin editor], default: :admin

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
