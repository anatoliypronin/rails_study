class AddIndexToCoursesAndLessons < ActiveRecord::Migration[6.0]
  def change
    add_index :courses, :title, unique: true
    add_index :lessons, :title, unique: true
  end
end
