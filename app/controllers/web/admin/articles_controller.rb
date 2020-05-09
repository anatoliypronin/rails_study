class Web::Admin::ArticlesController < Web::Admin::ApplicationController
  def index
    @articles = Article.decorate
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_attrs)
    @article.author = current_admin

    if @article.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def unpublish
    article = Article.find(params[:article_id])
    article.unpublish!
    redirect_to action: :index
  end

  def publish
    article = Article.find(params[:article_id])
    article.publish!
    redirect_to action: :index
  end

  private

  def article_attrs
    params.require(:article).permit(:title, :body, :author)
  end
end
