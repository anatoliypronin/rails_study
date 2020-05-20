require 'test_helper'

class Web::Student::SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new session page' do
    get new_student_session_path
    assert_response :success
  end

  test 'should post create new session for student' do
    student = create :student

    post student_session_path, params: { student: { email: student.email, phone_number: '89005554433' } }
    assert_response :success

    assert_nil session[:student_id]
  end

  test 'should delete destroy student session' do
    student = create :student
    sign_in_as_student(student)

    delete student_session_path
    assert_response :redirect

    assert_nil session[:student_id]
  end
end
