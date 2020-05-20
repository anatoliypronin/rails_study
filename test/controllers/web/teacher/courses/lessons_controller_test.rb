require 'test_helper'

class Web::Teacher::Courses::LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = create :course
    @lesson = create :lesson, course: @course
    sign_in_as_teacher(@lesson.course.teacher)
  end

  test 'should get new lesson page' do
    get new_teacher_course_lesson_path(@course.id)
    assert_response :success
  end

  test 'should post create course_lesson' do
    lesson_attrs = attributes_for :lesson
    lesson_attrs[:course_id] = @course.id

    post teacher_course_lessons_path(@course.id), params: { lesson: lesson_attrs }
    assert_response :redirect

    lesson = Lesson.last
    assert_equal lesson_attrs[:title], lesson.title
  end

  test 'should not post create course_lesson' do
    lesson_attrs = attributes_for :lesson, title: nil

    p lesson_attrs

    post teacher_course_lessons_path(@course.id), params: { lesson: lesson_attrs }
    assert_response :success

    lesson = Lesson.find_by(title: lesson_attrs[:title])
    assert_nil lesson
  end 
end
