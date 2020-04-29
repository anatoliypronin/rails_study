module AuthHelper
  def admin_sign_in(admin)
    session[:admin_id] = admin.id
  end

  def admin_sign_out
    session.delete(:admin_id)
  end

  def current_admin
    Admin.find_by(id: session[:admin_id])
  end

  def admin_signed_in?
    current_admin
  end

  def authenticate_admin!
    redirect_to new_admin_session_path unless admin_signed_in?
  end

  def teacher_sign_in(teacher)
    session[:teacher_id] = teacher.id
  end

  def teacher_sign_out
    session.delete(:teacher_id)
  end

  def current_teacher
    Teacher.find_by(id: session[:teacher_id])
  end

  def teacher_signed_in?
    current_teacher
  end

  def authenticate_teacher!
    redirect_to new_teacher_session_path unless teacher_signed_in?
  end
end
