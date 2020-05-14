class CreateStudentHomeworks < ActiveRecord::Migration[6.0]
  def change
    create_table :student_homeworks do |t|
      t.string :state, null: false
      t.integer :raiting, null: false
      t.text :student_comment
      t.text :teacher_comment
      t.datetime :date_begin, null: false
      t.datetime :date_end, null: false
      t.string :link_homework, null: false
      t.references :student, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.timestamps
    end
    add_index :student_homeworks, [:student_id, :lesson_id], unique: true
  end
end

