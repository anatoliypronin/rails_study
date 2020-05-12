class ArticleDecorator < ApplicationDecorator
  delegate_all

  def updated_at
    object.updated_at.strftime("%d-%m-%Y %I:%M")
  end
end
