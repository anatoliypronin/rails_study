class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :author, polymorphic: true
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :published
      t.datetime :published_at
      t.string :state, null: false
      t.timestamps
    end
  end
end
