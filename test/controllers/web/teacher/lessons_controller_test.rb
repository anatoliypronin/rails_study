require 'test_helper'

class Web::Teacher::LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher = create :teacher
    sign_in_as_teacher(@teacher)
    @lesson = create :lesson
  end

  test 'should get index lessons page' do
    get teacher_lessons_path
    assert_response :success
  end

  test 'should get new lesson page' do
    get new_teacher_lesson_path
    assert_response :success
  end

  test 'should post create lesson' do
    lesson_attrs = attributes_for :lesson
    @course = create :course
    lesson_attrs[:course_id] = @course.id

    post teacher_lessons_path, params: { lesson: lesson_attrs }
    assert_response :redirect

    lesson = Lesson.last
    assert_equal lesson_attrs[:title], lesson.title
  end

  test 'should not post create lesson' do
    lesson_attrs = attributes_for :lesson, title: nil

    post teacher_lessons_path, params: { lesson: lesson_attrs }
    assert_response :success

    lesson = Lesson.find_by(title: lesson_attrs[:title])
    assert_nil lesson
  end

  test 'should get show lesson page' do
    get teacher_lesson_path(@lesson.id)
    assert_response :success
  end

  test 'should get edit lesson page' do
    get edit_teacher_lesson_path(@lesson.id)
    assert_response :success
  end

  test 'should put update lesson' do
    attrs = {}
    attrs[:title] = generate :title

    put teacher_lesson_path(@lesson.id), params: { lesson: attrs }
    assert_response :redirect

    @lesson.reload
    assert_equal attrs[:title], @lesson.title
  end

  test 'should state del lesson' do
    put teacher_lesson_del_path(@lesson)
    assert_response :redirect

    @lesson.reload
    assert_equal 'deleted', @lesson.state
  end

  test 'should state active lesson' do
    @lesson = create :lesson, :del
    put teacher_lesson_restore_path(@lesson.id)
    assert_response :redirect

    @lesson.reload
    assert_equal 'active', @lesson.state
  end
end
