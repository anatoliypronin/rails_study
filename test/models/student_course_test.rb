require 'test_helper'

class StudentCourseTest < ActiveSupport::TestCase
  test 'should create StudentCourse and check whether the student and course are the same' do
    student = create :student
    course = create :course

    student.courses << course

    created_student_course = StudentCourse.last
    assert created_student_course

    assert_equal student.id, created_student_course.student_id
    assert_equal course.id, created_student_course.course_id
  end
end
