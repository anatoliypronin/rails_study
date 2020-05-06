class Article < ApplicationRecord
  extend Enumerize
  validates :title, :body, :state, presence: true

  belongs_to :author, polymorphic: true

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
