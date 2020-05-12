class ArticleDecorator < ApplicationDecorator
  def updated_at
    object.updated_at.strftime('%d-%m-%Y %I:%M')
  end
end
