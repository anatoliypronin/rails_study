class Web::Student::WelcomeController < Web::Student::ApplicationController
  def index
    @courses = Course.decorate
    @articles = Article.decorate
  end
end
