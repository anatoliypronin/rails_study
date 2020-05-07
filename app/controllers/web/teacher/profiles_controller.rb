class Web::Teacher::ProfilesController < Web::Teacher::ApplicationController
  def edit
    @teacher = Teacher.find(current_teacher.id)
  end

  def update
    @teacher = Teacher.find(current_teacher.id)

    if @teacher.update(teacher_attrs)
      redirect_to '/teacher'
    else
      render action: :edit
    end
  end

  private

  def teacher_attrs
    params.require(:teacher).permit(:first_name, :last_name, :email, :password, :description)
  end
end
