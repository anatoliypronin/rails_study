require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test 'should create course' do
    course = build :course
    course.save
    
    created_course = Course.last
    assert created_course
  end

  test 'should create course without teacher' do
    course = build :course, teacher: nil
    course.save

    created_course = Course.last
    assert created_course
  end

  test 'should not create course with title length > 50' do
    course = build :course, title: 'title' * 11
    course.save

    created_course = Course.last
    assert_not created_course
  end

  test 'should not create course with incorrect state' do
    course = build :student, state: 'any state'
    course.save

    created_course = Course.last
    assert_not created_course
  end
end
