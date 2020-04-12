require 'test_helper'

class StudentCourseTest < ActiveSupport::TestCase
  test 'should create StudentCourse' do
    student = create :student
    course = create :course
    p Student.all
    p Course.all
    
    # student.courses << Course.last
    p StudentCourse.last
    # created_student_course = StudentCourse.last
    assert true
  end
end
