require 'test_helper'

class Web::Admin::LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson = create :lesson
    @admin = create :admin
    sign_in_as_admin(@admin)
  end

  test 'should get index lesson page' do
    get admin_lessons_path
    assert_response :success
  end

  test 'should get new lesson page' do
    get new_admin_lesson_path
    assert_response :success
  end

  test 'should not get new lesson page for editor' do
    editor = create :admin, :editor
    sign_in_as_admin(editor)

    get new_admin_lesson_path
    assert_redirected_to admin_root_path
  end

  test 'should post create lesson' do
    lesson_attrs = attributes_for :lesson
    lesson_attrs[:course_id] = @lesson.course_id

    post admin_lessons_path, params: { lesson: lesson_attrs }
    assert_response :redirect

    lesson = Lesson.last
    assert_equal lesson_attrs[:title], lesson.title
  end

  test 'should not post create lesson' do
    lesson_attrs = attributes_for :lesson, title: nil

    post admin_lessons_path, params: { lesson: lesson_attrs }
    assert_response :success

    lesson = Lesson.find_by(title: lesson_attrs[:title])
    assert_nil lesson
  end

  test 'should get show lesson page' do
    get admin_lesson_path(@lesson.id)
    assert_response :success
  end

  test 'should get edit lesson page' do
    get edit_admin_lesson_path(@lesson.id)
    assert_response :success
  end

  test 'should not get edit lesson page for editor' do
    editor = create :admin, :editor
    sign_in_as_admin(editor)

    get edit_admin_lesson_path(@lesson.id)
    assert_redirected_to admin_root_path
  end

  test 'should put update lesson' do
    attrs = {}
    attrs[:title] = generate :title

    put admin_lesson_path(@lesson.id), params: { lesson: attrs }
    assert_response :redirect

    @lesson.reload
    assert_equal attrs[:title], @lesson.title
  end

  test 'should state del lesson' do
    put admin_lesson_del_path(@lesson)
    assert_response :redirect

    @lesson.reload
    assert_equal 'deleted', @lesson.state
  end

  test 'should state active lesson' do
    @lesson = create :lesson, :del
    put admin_lesson_restore_path(@lesson.id)
    assert_response :redirect

    @lesson.reload
    assert_equal 'active', @lesson.state
  end
end
