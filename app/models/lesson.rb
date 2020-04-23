class Lesson < ApplicationRecord
  validates :title, :description, :homework, :state, presence: true
  validates :title, length: { maximum: 50 }
end
