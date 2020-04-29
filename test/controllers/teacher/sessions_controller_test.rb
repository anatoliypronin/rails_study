require 'test_helper'

class Teacher::SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new session page' do
    get new_teacher_session_path
    assert_response :success
  end

  test 'should post create new session for teacher' do
    teacher = create :teacher

    post teacher_session_path, params: { teacher: { email: teacher.email, password: 'bad_password' } }
    assert_response :success

    assert_nil session[:teacher_id]
  end

  test 'should delete destroy teacher session' do
    teacher = create :teacher
    sign_in_as_admin(teacher)

    delete teacher_session_path
    assert_response :redirect

    assert_nil session[:teacher_id]
  end
end
