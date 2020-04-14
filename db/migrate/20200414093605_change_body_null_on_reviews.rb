class ChangeBodyNullOnReviews < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:reviews, :body, false)
  end
end
