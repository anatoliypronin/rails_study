class ChangeHomeworkNullOnLesson < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:lessons, :homework, false)
  end
end
