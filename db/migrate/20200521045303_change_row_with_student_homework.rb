class ChangeRowWithStudentHomework < ActiveRecord::Migration[6.0]
  def change
    change_column_null :student_homeworks, :raiting, true
    change_column_null :student_homeworks, :link_homework, true
  end
end
