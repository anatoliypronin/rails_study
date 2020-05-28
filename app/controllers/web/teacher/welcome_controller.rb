class Web::Teacher::WelcomeController < Web::Teacher::ApplicationController
  def index
    @courses = Course.where(teacher: current_teacher).decorate
    @articles = Article.decorate
    @student_homeworks = StudentHomework.where(lesson_id: current_teacher.lessons.ids).order(:lesson_id)
    @hash_graph = hash_graph
  end

  def hash_graph
    result = {}
    @student_homeworks.where.not(raiting: nil).each do |sh|
      lesson = Lesson.find(sh.lesson_id)
      avg_raiting = @student_homeworks.where.not(raiting: nil).where(lesson_id: sh.lesson_id).sum(:raiting) / @student_homeworks.where.not(raiting: nil).where(lesson_id: sh.lesson_id).count
      result[lesson.title] = avg_raiting
    end
    result
  end
end
