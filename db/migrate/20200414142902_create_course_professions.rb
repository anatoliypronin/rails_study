class CreateCourseProfessions < ActiveRecord::Migration[6.0]
  def change
    create_table :course_professions do |t|
      t.references :course, null: false, foreign_key: true
      t.references :profession, null: false, foreign_key: true

      t.timestamps
    end
    add_index :course_professions, [:course_id, :profession_id], unique: true
  end
end
