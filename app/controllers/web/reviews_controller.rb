class Web::ReviewsController < Web::ApplicationController
  def index
    @reviews = Review.decorate
  end

  def show
    @reviews = Review.find(params[:id])
  end
end
