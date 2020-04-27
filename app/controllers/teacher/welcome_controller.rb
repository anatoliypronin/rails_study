class Teacher::WelcomeController < Teacher::ApplicationController
  def index
    @courses = Course.all.decorate
    # необходимо добавить 2 модели article adn StudentHomework
    # @articles = Article.all
    # @student_homework = StudentHomework.all
  end
end