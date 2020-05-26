require 'test_helper'

class Web::Student::CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = create :student
    @course = create :course
    sign_in_as_student(@student)
  end

  test 'should get index courses page' do
    get student_courses_path
    assert_response :success
  end

  test 'should get show course page' do
    get student_course_path(@course.id)
    assert_response :success
  end
end
