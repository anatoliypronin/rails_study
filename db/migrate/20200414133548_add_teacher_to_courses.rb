class AddTeacherToCourses < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :teacher, null: true, foreign_key: true
  end
end
