require 'test_helper'

class Web::Admin::StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = create :student
    @admin = create :admin
    sign_in_as_admin(@admin)
  end
  test 'should get index students page' do
    get admin_students_path
    assert_response :success
  end

  test 'should get new student page' do
    get new_admin_student_path
    assert_response :success
  end

  test 'should not get new student page for editor' do
    editor = create :admin, :editor
    sign_in_as_admin(editor)

    get new_admin_student_path
    assert_redirected_to admin_root_path
  end

  test 'should post create student' do
    student_attrs = attributes_for :student
    post admin_students_path, params: { student: student_attrs }
    assert_response :redirect

    student = Student.last
    assert_equal student_attrs[:email], student.email
  end

  test 'should not post create student' do
    student_attrs = attributes_for :student, email: nil
    post admin_students_path, params: { student: student_attrs }
    assert_response :success

    student = Student.find_by(email: student_attrs[:email])
    assert_nil student
  end

  test 'should get show student page' do
    get admin_student_path(@student.id)
    assert_response :success
  end

  test 'should get edit student page' do
    get edit_admin_student_path(@student.id)
    assert_response :success
  end

  test 'should not get edit student page for editor' do
    editor = create :admin, :editor
    sign_in_as_admin(editor)

    get edit_admin_student_path(@student.id)
    assert_redirected_to admin_root_path
  end

  test 'should put update student' do
    attrs = {}
    attrs[:first_name] = generate :first_name

    put admin_student_path(@student.id), params: { student: attrs }
    assert_response :redirect

    @student.reload
    assert_equal attrs[:first_name], @student.first_name
  end

  test 'should state del srudent' do
    put admin_student_del_path(@student)
    assert_response :redirect

    @student.reload
    assert_equal 'deleted', @student.state
  end

  test 'should state active student' do
    @student.del!
    put admin_student_restore_path(@student.id)
    assert_response :redirect

    @student.reload
    assert_equal 'active', @student.state
  end
end
