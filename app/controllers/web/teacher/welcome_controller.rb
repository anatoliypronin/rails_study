class Web::Teacher::WelcomeController < Web::Teacher::ApplicationController
  def index
    @courses = Course.where(teacher: current_teacher).order(updated_at: :desc).decorate.first(3)
    @student_homeworks = StudentHomework.where(lesson_id: current_teacher.lessons.ids).order(updated_at: :desc).decorate.first(3)
    @articles = Article.where(author: current_teacher).order(updated_at: :desc).decorate.first(3)
    student_homeworks_graph = StudentHomework.where('lesson_id IN (?) AND raiting IS NOT null', current_teacher.lessons.ids).order(:lesson_id)
    @hash_graph = hash_graph(student_homeworks_graph)
  end

  def hash_graph(student_homeworks)
    result = {}
    student_homeworks.each do |sh|
      lesson = Lesson.find(sh.lesson_id)
      avg_raiting = student_homeworks.where(lesson_id: sh.lesson_id).sum(:raiting) / student_homeworks.where(lesson_id: sh.lesson_id).count
      result[lesson.title] = avg_raiting
    end
    result
  end
end
