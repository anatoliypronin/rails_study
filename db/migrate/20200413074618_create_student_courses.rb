class CreateStudentCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :student_courses do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
    add_index :student_courses, [:student_id, :course_id], unique: true
  end
end
