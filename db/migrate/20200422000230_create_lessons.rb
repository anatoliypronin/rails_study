class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.text :homework, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
