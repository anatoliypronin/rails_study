require 'test_helper'

class LessonTest < ActiveSupport::TestCase

  test 'should create course' do
    lesson = build :lesson, state: "any state"
    lesson.save
    p lesson
    created_lesson = Lesson.last
    assert created_lesson
  end

  test 'should not create lesson with title length > 50' do
    lesson = build :lesson, title: 'Title' * 20
    lesson.save

    created_lesson = Lesson.last
    assert_not created_lesson
  end

  test 'should not create lesson with invalid state' do
    lesson = build :lesson, state: nil
    lesson.save

    created_lesson = Lesson.last
    assert_not created_lesson
  end
end
