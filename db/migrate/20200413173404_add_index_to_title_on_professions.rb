class AddIndexToTitleOnProfessions < ActiveRecord::Migration[6.0]
  def change
    add_index :professions, [:title], unique: true
  end
end
