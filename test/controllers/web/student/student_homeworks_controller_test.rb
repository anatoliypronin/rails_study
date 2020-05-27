require 'test_helper'

class Web::Student::StudentHomeworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_homework = create :student_homework
    @student = @student_homework.student
    sign_in_as_student(@student)
  end

  test 'should get index student_homeworks page' do
    get student_student_homeworks_path
    assert_response :success
  end

  test 'should get show student_homework page' do
    get student_student_homework_path(@student_homework)
    assert_response :success
  end

  test 'should get edit student_homework page' do
    get edit_student_student_homework_path(@student_homework)
    assert_response :success
  end

  test 'should put update student_homework' do
    attrs = {}
    attrs[:link_homework] = generate :link_homework

    put student_student_homework_path(@student_homework.id), params: { student_homework: attrs }
    assert_response :redirect

    @student_homework.reload
    assert_equal attrs[:link_homework], @student_homework.link_homework
  end
end
