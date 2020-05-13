class Web::Teacher::SessionsController < Web::Teacher::ApplicationController
  skip_before_action :authenticate_teacher!, only: %i[new create]
  def new; end

  def create
    teacher = Teacher.find_by(email: params[:teacher][:email])
    if teacher&.authenticate(params[:teacher][:password])
      teacher_sign_in(teacher)
      redirect_to teacher_root_path
    else
      render action: :new
    end
  end

  def destroy
    teacher_sign_out
    redirect_to new_teacher_session_path
  end
end
