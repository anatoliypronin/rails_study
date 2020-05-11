require 'test_helper'

class Teacher::CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = create :course
    @teacher = create :teacher
    sign_in_as_teacher(@teacher)
  end

  test 'should get index course page' do
    get teacher_courses_path
    assert_response :success
  end

  test 'should get new course page' do
    get new_teacher_course_path
    assert_response :success
  end

  test 'should post create course' do
    course_attrs = attributes_for :course

    post teacher_courses_path, params: { course: course_attrs }
    assert_response :redirect

    course = Course.last
    assert_equal course_attrs[:title], course.title
  end

  test 'should not post create course' do
    course_attrs = attributes_for :course, title: nil

    post teacher_courses_path, params: { course: course_attrs }
    assert_response :success

    course = Course.find_by(title: course_attrs[:title])
    assert_nil course
  end

  test 'should get show course page' do
    get teacher_course_path(@course.id)
    assert_response :success
  end

  test 'should get edit course page' do
    get edit_teacher_course_path(@course.id)
    assert_response :success
  end

  test 'should put update course' do
    attrs = {}
    attrs[:title] = generate :title

    put teacher_course_path(@course.id), params: { course: attrs }
    assert_response :redirect

    @course.reload
    assert_equal attrs[:title], @course.title
  end
end