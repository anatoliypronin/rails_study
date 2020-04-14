class AddIndexToStudentIdAndCourseIdOnReviews < ActiveRecord::Migration[6.0]
  def change
    add_index :reviews, [:student_id, :course_id], unique: true
  end
end
