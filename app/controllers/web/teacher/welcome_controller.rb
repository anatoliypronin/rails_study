class Web::Teacher::WelcomeController < Web::Teacher::ApplicationController
  def index
    @courses = Course.where(teacher: current_teacher).order(updated_at: :desc).decorate.first(3)
    @student_homeworks = StudentHomework.where(lesson_id: current_teacher.lessons.ids).order(updated_at: :desc).decorate.first(3)
    @articles = Article.where(author: current_teacher).order(updated_at: :desc).decorate.first(3)
  end
end
