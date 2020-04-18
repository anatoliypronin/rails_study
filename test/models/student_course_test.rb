require 'test_helper'

class StudentCourseTest < ActiveSupport::TestCase
  test 'should create StudentCourse and check whether the student and course are the same' do
    student = create :student
    course = create :course

    student.in_progress << course

    created_student_course = StudentCourse.last
    assert created_student_course

    assert_equal student, created_student_course.student
    assert_equal course, created_student_course.course
  end
end