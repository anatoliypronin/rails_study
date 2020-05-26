class Web::ReviewsController < Web::ApplicationController
  def index
    @reviews = Review.decorate
  end

  def show
    @review = Review.find(params[:id]).decorate
  end
end
