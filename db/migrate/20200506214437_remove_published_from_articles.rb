class RemovePublishedFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :published, :boolean
    remove_column :articles, :published_at, :datetime
  end
end
