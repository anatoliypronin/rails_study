class Web::Teacher::WelcomeController < Web::Teacher::ApplicationController
  def index
    @courses = Course.where(teacher: current_teacher).decorate
    @articles = Article.decorate
    @student_homeworks = StudentHomework.where(lesson_id: current_teacher.lessons.ids).decorate
  end
end
