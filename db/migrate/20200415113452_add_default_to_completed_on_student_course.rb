class AddDefaultToCompletedOnStudentCourse < ActiveRecord::Migration[6.0]
  def change
    change_column :student_courses, :completed, :boolean, default: false
  end
end
