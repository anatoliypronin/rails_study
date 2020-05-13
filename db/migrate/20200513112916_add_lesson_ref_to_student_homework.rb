class AddLessonRefToStudentHomework < ActiveRecord::Migration[6.0]
  def change
    add_reference :student_homeworks, :lesson, null: false, foreign_key: true
    add_index :student_homeworks, [:student_id, :lesson_id], unique: true
  end
end