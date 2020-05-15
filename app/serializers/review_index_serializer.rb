class ReviewIndexSerializer < ActiveModel::Serializer
  attributes :course, :student, :body
end
