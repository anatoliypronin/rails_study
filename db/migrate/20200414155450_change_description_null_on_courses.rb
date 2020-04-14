class ChangeDescriptionNullOnCourses < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:courses, :description, false)
  end
end
