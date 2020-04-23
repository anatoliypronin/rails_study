class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.text :homework
      t.string :state

      t.timestamps
    end
  end
end
