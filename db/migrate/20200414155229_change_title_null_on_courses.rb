class ChangeTitleNullOnCourses < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:courses, :title, false)
  end
end
