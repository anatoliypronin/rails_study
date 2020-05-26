class Web::Student::StudentCoursesController < Web::Student::ApplicationController
  def create
    @student_course = StudentCourse.new(student_course_attrs)

    if @student_course.save
      redirect_to student_courses_path
    else
      redirect_to student_course_path(student_course_attrs[:course_id])
    end
  end

  def destroy
    student_course = StudentCourse.find(params[:id])
    student_course.destroy
    redirect_to student_courses_path
  end

  private

  def student_course_attrs
    params.require(:student_course).permit(:student_id, :course_id)
  end
end
