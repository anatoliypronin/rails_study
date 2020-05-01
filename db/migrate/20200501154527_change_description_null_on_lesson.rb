class ChangeDescriptionNullOnLesson < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:lessons, :description, false)
  end
end
