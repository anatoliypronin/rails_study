class AddIndexToStudentIdAndCourseIdOnStudentCourses < ActiveRecord::Migration[6.0]
  def change
    add_index :student_courses, [:student_id, :course_id], unique: true
  end
end
