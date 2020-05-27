require 'test_helper'

class Web::Student::CoursesController::LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = create :student
    sign_in_as_student(@student)
    @course = create :course
    @lesson = create :lesson
  end

  test 'should get show lesson page' do
    get student_course_lesson_path(@course, @lesson)
    assert_response :success
  end
end
