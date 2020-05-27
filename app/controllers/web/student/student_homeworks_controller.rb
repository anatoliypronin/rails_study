class Web::Student::StudentHomeworksController < Web::Student::ApplicationController
  def index
    @student_homeworks = StudentHomework.where(student_id: current_student.id).decorate
  end

  def show
    student_homeworks = StudentHomework.where(student_id: current_student.id)
    @student_homework = student_homeworks.find(params[:id]).decorate
  end

  def edit
    student_homeworks = StudentHomework.where(student_id: current_student.id)
    @student_homework = student_homeworks.find(params[:id])
  end

  def update
    student_homeworks = StudentHomework.where(student_id: current_student.id)
    @student_homework = student_homeworks.find(params[:id])

    if @student_homework.update(student_homework_attrs)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  private

  def student_homework_attrs
    params.require(:student_homework).permit(:raiting, :student_comment, :teacher_comment, :date_begin, :date_end, :link_homework, :student_id, :lesson_id)
  end
end
