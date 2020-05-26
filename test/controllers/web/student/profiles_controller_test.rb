require 'test_helper'

class Web::Student::ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = create :student
    sign_in_as_student(@student)
  end

  test 'should get edit student page' do
    get edit_student_profile_path(@student.id)
    assert_response :success
  end

  test 'should put update student' do
    attrs = {}
    attrs[:first_name] = generate :first_name

    put student_profile_path(@student.id), params: { student: attrs }
    assert_response :redirect

    @student.reload
    assert_equal attrs[:first_name], @student.first_name
  end
end
