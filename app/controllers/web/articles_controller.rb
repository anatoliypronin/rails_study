class Web::ArticlesController < Web::ApplicationController
  def index
    @articles = Article.decorate
  end

  def show
    @article = Article.find(params[:id])
  end
end
