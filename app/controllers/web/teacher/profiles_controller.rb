class Web::Teacher::ProfilesController < Web::Teacher::ApplicationController
  def edit
    @teacher = current_teacher
  end

  def update
    @teacher = current_teacher

    if @teacher.update(teacher_attrs)
      redirect_to teacher_root_path
    else
      render action: :edit
    end
  end

  private

  def teacher_attrs
    params.require(:teacher).permit(:first_name, :last_name, :email, :password, :description, course_ids: [], lesson_ids: [])
  end
end
