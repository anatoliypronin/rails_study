class AddIndexToPhoneNumberOnStudents < ActiveRecord::Migration[6.0]
  def change
    add_index :students, :phone_number, unique: true
  end
end
