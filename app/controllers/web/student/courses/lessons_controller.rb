class Web::Student::Courses::LessonsController < Web::Student::Courses::ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
  end
end
