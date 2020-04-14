class ChangeLastNameNullOnStudents < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:students, :last_name, false)
  end
end
