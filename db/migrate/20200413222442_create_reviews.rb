class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :body :body, null: false
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
    change_column_null(:reviews, :body, false)
    add_index :reviews, [:student_id, :course_id], unique: true
  end
end
