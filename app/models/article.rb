class Article < ApplicationRecord
  extend Enumerize
  validates :title, :body, :state, presence: true

  belongs_to :author, polymorphic: true

  state_machine initial: :published do
    state :published
    state :unpublished

    event :unpublish do
      transition published: :unpublished
    end

    event :publish do
      transition unpublished: :published
    end
  end
end
