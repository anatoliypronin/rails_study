class TrueAddIndexToEmailOnTeachers < ActiveRecord::Migration[6.0]
  def change
    add_index :teachers, :email, unique: true
  end
end
