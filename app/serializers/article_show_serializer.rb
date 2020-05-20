class ArticleShowSerializer < ActiveModel::Serializer
  attributes :title, :body, :author, :updated_at
end
