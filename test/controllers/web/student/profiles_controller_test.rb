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

  test 'should delete student photo from profile' do
    student = create :student, photo_file_name: "150155-svet-kapyushon-balahon-verhnyaya_odezhda-ma", photo_content_type: "image/jpeg", photo_file_size: 508313, photo_updated_at: "2020-05-26 12:08:14"  
    sign_in_as_student(student)
    put delete_photo_student_profile_path(student.id)
    assert_response :success

    student.reload
    assert_nil student.photo_file_name
  end
  
  test 'should get show student profile' do
    get student_profile_path(@student.id)
    assert_response :success
  end
end
