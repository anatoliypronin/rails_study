require 'test_helper'

class Web::Teacher::StudentHomeworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_homework = create :student_homework
    @teacher = @student_homework.lesson.course.teacher
    sign_in_as_teacher(@teacher)
  end

  test 'should get index student_homeworks page' do
    get teacher_student_homeworks_path
    assert_response :success
  end

  test 'should get new student_homework page' do
    get new_teacher_student_homework_path
    assert_response :success
  end

  test 'should post create student_homework' do
    student_homework_attrs = attributes_for :student_homework
    @student = create :student
    student_homework_attrs[:student_id] = @student.id
    @lesson = create :lesson
    student_homework_attrs[:lesson_id] = @lesson.id

    post teacher_student_homeworks_path, params: { student_homework: student_homework_attrs }
    assert_response :redirect

    student_homework = StudentHomework.last
    assert_equal student_homework_attrs[:student_id], student_homework.student.id
    assert_equal student_homework_attrs[:lesson_id], student_homework.lesson.id
  end

  test 'should not post create student_homework' do
    student_homework_attrs = attributes_for :student_homework, date_begin: nil

    post teacher_student_homeworks_path, params: { student_homework: student_homework_attrs }
    assert_response :success

    student_homework = StudentHomework.find_by(date_begin: student_homework_attrs[:date_begin])
    assert_nil student_homework
  end

  test 'should get show student_homework page' do
    get teacher_student_homework_path(@student_homework)
    assert_response :success
  end

  test 'should get edit student_homework page' do
    get edit_teacher_student_homework_path(@student_homework)
    assert_response :success
  end

  test 'should put update student_homework' do
    attrs = {}
    attrs[:link_homework] = generate :link_homework

    put teacher_student_homework_path(@student_homework.id), params: { student_homework: attrs }
    assert_response :redirect

    @student_homework.reload
    assert_equal attrs[:link_homework], @student_homework.link_homework
  end

  test 'should state doing student_homework' do
    student_homework = create :student_homework, :testing
    teacher = student_homework.lesson.course.teacher
    sign_in_as_teacher(teacher)

    put teacher_student_homework_modify_path(student_homework)
    assert_response :redirect

    student_homework.reload
    assert_equal 'doing', student_homework.state
  end

  test 'should state checking student_homework' do
    student_homework = create :student_homework, :modify
    teacher = student_homework.lesson.course.teacher
    sign_in_as_teacher(teacher)

    put teacher_student_homework_testing_path(student_homework)
    assert_response :redirect

    student_homework.reload
    assert_equal 'checking', student_homework.state
  end

  test 'should state accepted student_homework' do
    student_homework = create :student_homework, :testing
    teacher = student_homework.lesson.course.teacher
    sign_in_as_teacher(teacher)

    put teacher_student_homework_done_path(student_homework)
    assert_response :redirect

    student_homework.reload
    assert_equal 'accepted', student_homework.state
  end
end
