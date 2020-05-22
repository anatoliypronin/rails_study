require 'test_helper'

class Web::Student::SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new session page' do
    student = create :student
    sign_in_as_student(student)
    get new_student_session_path
    assert_response :success
  end

  test 'should post create session for student' do
    student = create :student
    sign_in_as_student(student)
    assert_response :redirect

    assert_equal session[:student_id], student.id
  end

  test 'should delete destroy session page for student' do
    student = create :student
    sign_in_as_student(student)

    assert_equal session[:student_id], student.id

    delete student_session_path
    assert_response :redirect

    assert_nil session[:student]
  end
end
