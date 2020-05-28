class Web::Student::WelcomeController < Web::Student::ApplicationController
  def index
    @courses = Course.where(state: 'active').order(updated_at: :desc).decorate
    # @student_homeworks = StudentHomework.where(lesson_id: current_student.lessons.ids).decorate
  end
end
