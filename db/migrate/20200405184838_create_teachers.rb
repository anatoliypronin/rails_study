# frozen_string_literal: true

class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :description
      t.string :state

      t.timestamps
    end
  end
end
