require 'test_helper'

class Web::Admin::CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = create :course
    @admin = create :admin
    sign_in_as_admin(@admin)
  end

  test 'should get index course page' do
    get admin_courses_path
    assert_response :success
  end

  test 'should get new course page' do
    get new_admin_course_path
    assert_response :success
  end

  test 'should post create course' do
    course_attrs = attributes_for :course

    post admin_courses_path, params: { course: course_attrs }
    assert_response :redirect

    course = Course.last
    assert_equal course_attrs[:title], course.title
  end

  test 'should not post create course' do
    course_attrs = attributes_for :course, title: nil

    post admin_courses_path, params: { course: course_attrs }
    assert_response :success

    course = Course.find_by(title: course_attrs[:title])
    assert_nil course
  end

  test 'should get show course page' do
    get admin_course_path(@course.id)
    assert_response :success
  end

  test 'should get edit course page' do
    get edit_admin_course_path(@course.id)
    assert_response :success
  end

  test 'should put update course' do
    attrs = {}
    attrs[:title] = generate :title

    put admin_course_path(@course.id), params: { course: attrs }
    assert_response :redirect

    @course.reload
    assert_equal attrs[:title], @course.title
  end

  test 'should state del course' do
    put admin_course_del_path(@course)
    assert_response :redirect

    @course.reload
    assert_equal 'deleted', @course.state
  end

  test 'should state active course' do
    @course = create :course, :del
    put admin_course_restore_path(@course.id)
    assert_response :redirect

    @course.reload
    assert_equal 'active', @course.state
  end

  test 'should put update course with teacher' do
    course_attrs = attributes_for :course
    course_attrs[:teacher_id] = @course.teacher_id
    put admin_course_path(@course), params: { course: course_attrs }
    assert_response :redirect

    @course.reload
    assert_equal course_attrs[:teacher_id], @course.teacher_id
  end

  test 'should put update course with teacher and professions' do
    profession = create :profession
    course_attrs = attributes_for :course
    course_attrs[:teacher_id] = @course.teacher_id
    course_attrs[:profession_ids] = [profession.id]

    put admin_course_path(@course), params: { course: course_attrs }
    assert_response :redirect

    @course.reload
    assert @course.professions.include?(profession)
  end
end
