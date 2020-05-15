class ArticleIndexSerializer < ActiveModel::Serializer
  attributes :title, :body, :updated_at
end
