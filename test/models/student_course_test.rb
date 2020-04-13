require 'test_helper'

class StudentCourseTest < ActiveSupport::TestCase
  test 'should create StudentCourse' do
    student = create :student
    create :course

    student.courses << Course.last

    created_student_course = StudentCourse.last
    assert created_student_course
  end
end
