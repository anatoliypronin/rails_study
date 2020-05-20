class Web::Teacher::Courses::LessonsController < Web::Teacher::Courses::ApplicationController
  def new
    @lesson = resource_course.lessons.new
  end

  def create
    @lesson = resource_course.lessons.new(lesson_attrs)

    if @lesson.save
      redirect_to teacher_lessons_path
    else
      render action: :new
    end
	end
	def lesson_attrs
    params.require(:lesson).permit(:title, :description, :homework, :course_id)
  end
end