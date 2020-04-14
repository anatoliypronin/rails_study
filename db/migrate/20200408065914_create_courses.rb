class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :state

      t.timestamps
    end
    change_column_null(:courses, :description, false)
    change_column_null(:courses, :title, false)
  end
end
