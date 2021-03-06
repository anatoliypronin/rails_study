require 'test_helper'

class Web::Admin::TeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher = create :teacher
    @admin = create :admin
    sign_in_as_admin(@admin)
  end
  test 'should get index teachers page' do
    get admin_teachers_path
    assert_response :success
  end

  test 'should get new teacher page' do
    get new_admin_teacher_path
    assert_response :success
  end

  test 'should not get new teacher page for editor' do
    editor = create :admin, :editor
    sign_in_as_admin(editor)

    get new_admin_teacher_path
    assert_redirected_to admin_root_path
  end

  test 'should post create teacher' do
    teacher_attrs = attributes_for :teacher
    post admin_teachers_path, params: { teacher: teacher_attrs }
    assert_response :redirect

    teacher = Teacher.last
    assert_equal teacher_attrs[:email], teacher.email
  end

  test 'should not post create teacher' do
    teacher_attrs = attributes_for :teacher, email: nil
    post admin_teachers_path, params: { teacher: teacher_attrs }
    assert_response :success

    teacher = Teacher.find_by(email: teacher_attrs[:email])
    assert_nil teacher
  end

  test 'should get show teacher page' do
    get admin_teacher_path(@teacher.id)
    assert_response :success
  end

  test 'should get edit teacher page' do
    get edit_admin_teacher_path(@teacher.id)
    assert_response :success
  end

  test 'should not get edit teacher page for editor' do
    editor = create :admin, :editor
    sign_in_as_admin(editor)

    get edit_admin_teacher_path(@teacher.id)
    assert_redirected_to admin_root_path
  end

  test 'should put update teacher' do
    attrs = {}
    attrs[:first_name] = generate :first_name

    put admin_teacher_path(@teacher.id), params: { teacher: attrs }
    assert_response :redirect

    @teacher.reload
    assert_equal attrs[:first_name], @teacher.first_name
  end

  test 'should state del teacher' do
    put admin_teacher_del_path(@teacher.id)
    assert_response :redirect
    @teacher.reload
    assert_equal 'deleted', @teacher.state
  end

  test 'should state active teacher' do
    @teacher = create :teacher, :del
    put admin_teacher_restore_path(@teacher.id)
    assert_response :redirect

    @teacher.reload
    assert_equal 'active', @teacher.state
  end
end
