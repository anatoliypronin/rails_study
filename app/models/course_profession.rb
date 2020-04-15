class CourseProfession < ApplicationRecord
  belongs_to :course
  belongs_to :profession

  validates :course, uniqueness: { scope: :profession }
end
