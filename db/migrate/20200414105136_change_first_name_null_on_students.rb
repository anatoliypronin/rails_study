class ChangeFirstNameNullOnStudents < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:students, :first_name, false)
  end
end
