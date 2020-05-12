class AddLessonRefToCourses < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :lesson, foreign_key: true
  end
end
