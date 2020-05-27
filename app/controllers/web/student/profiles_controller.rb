class Web::Student::ProfilesController < Web::Student::ApplicationController
  def edit
    @student = current_student
  end

  def update
    @student = current_student

    if @student.update(student_attrs)
      redirect_to student_profile_path
    else
      render action: :edit
    end
  end

  def show
    @student = current_student.decorate
  end

  def delete_photo
    @student = current_student
    @student.update(photo: nil)
    render action: :edit
  end

  private

  def student_attrs
    params.require(:student).permit(:first_name, :last_name, :phone_number, :email, :student_id, :photo)
  end
end
