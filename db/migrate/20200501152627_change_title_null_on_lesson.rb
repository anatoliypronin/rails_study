class ChangeTitleNullOnLesson < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:lessons, :title, false)
  end
end
