require "test_helper"

class Web::Student::StudentCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = create :student
    @course = create :course
    sign_in_as_student(@student)
  end

  test "should post create student course" do
    student_course_attrs = attributes_for :student_course
    student_course_attrs[:student_id] = @student.id
    student_course_attrs[:course_id] = @course.id
    
    post student_student_courses_path, params: { student_course: student_course_attrs }
    
    student_course = StudentCourse.last
    assert_equal student_course_attrs[:student_id], student_course.student_id
    assert_equal student_course_attrs[:course_id], student_course.course_id
  end

  test "should delete destroy student course" do
    student_course = create :student_course

    delete student_student_course_path(student_course)
    assert_response :redirect

    assert_not StudentCourse.exists?(student_course.id)
  end
end
