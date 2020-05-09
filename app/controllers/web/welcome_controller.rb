class Web::WelcomeController < Web::ApplicationController
  def index
    @articles = Article.where(state: :publish)
    @professions = Profession.where(state: :active)
  end
end
