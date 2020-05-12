class Web::Teacher::WelcomeController < Web::Teacher::ApplicationController
  def index
    @courses = Course.where(teacher_id: current_teacher.id).decorate
    @articles = Article.decorate
    # необходимо добавить 2 модели article adn StudentHomework
    # @student_homework = StudentHomework.where(teacher_id: current_teacher.id)
  end
end
