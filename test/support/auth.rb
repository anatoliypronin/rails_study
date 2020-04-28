module Support
  module Auth
    def sign_in_as_admin(admin)
      post admin_session_path, params: { admin: { email: admin.email, password: admin.password } }
    end

    def sign_in_as_teacher(teacher)
      post teacher_session_path, params: { teacher: { email: teacher.email, password: teacher.password } }
    end
  end
end
