class Api::V1::ReviewsController < Api::V1::ApplicationController
  def index
    reviews = Review.order(body: :asc)
    render json: reviews, each_serializer: ReviewIndexSerializer
  end

  def show
    review = Review.find(params[:id])
    render json: review, serializer: ReviewShowSerializer
  end
end
