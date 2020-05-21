class Web::Student::SessionsController < Web::Student::ApplicationController
  skip_before_action :authenticate_student!, only: %i[new create]
  def new; end

  def create
    if (student = Student.find_by(phone_number: params[:student][:phone_number]))
      student_sign_in(student)
      redirect_to student_root_path
    else
      render action: :new
    end
  end

  def destroy
    student_sign_out
    redirect_to root_path
  end
end
