class Web::ArticlesController < Web::ApplicationController
  def index
    @articles = Article.where(state: :published).decorate
  end

  def show
    @article = Article.find(params[:id]).decorate
  end
end
