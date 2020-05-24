class Web::Student::CoursesController < Web::Student::ApplicationController
  def index
    @courses = current_student.courses.decorate
  end

  def show
    @course = Course.find(params[:id]).decorate
  end
end
