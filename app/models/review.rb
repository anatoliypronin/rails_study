# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :body, presence: true
end
