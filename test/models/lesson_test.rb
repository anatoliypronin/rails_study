require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test 'should create lesson' do
    lesson = build :lesson
    lesson.save

    created_lesson = Lesson.last
    assert created_lesson
  end

  test 'should not create lesson with title length > 50' do
    lesson = build :lesson, title: 'title' * 11
    lesson.save

    created_lesson = Lesson.last
    assert_not created_lesson
  end

  test 'should not create lesson with incorrect state' do
    lesson = build :student, state: 'any state'
    lesson.save

    created_lesson = Lesson.last
    assert_not created_lesson
  end
end
