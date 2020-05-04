require 'test_helper'

class Teacher::TeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher = create :teacher
    sign_in_as_teacher(@teacher)
  end

  test 'should get new teacher page' do
    get new_teacher_teachers_path
    assert_response :success
  end

  test 'should post create teacher' do
    teacher_attrs = attributes_for :teacher
    post teacher_teachers_path, params: { teacher: teacher_attrs }
    assert_response :redirect

    teacher = Teacher.last
    assert_equal teacher_attrs[:email], teacher.email
  end

  test 'should not post create teacher' do
    teacher_attrs = attributes_for :teacher, email: nil
    post teacher_teachers_path, params: { teacher: teacher_attrs }
    assert_response :success

    teacher = Teacher.find_by(email: teacher_attrs[:email])
    assert_nil teacher
  end

  test 'should get show teacher page' do
    get teacher_teachers_path(@teacher.id)
    assert_response :success
  end

  test 'should get edit teacher page' do
    get edit_teacher_teachers_path(@teacher.id)
    assert_response :success
  end

  test 'should put update teacher' do
    attrs = {}
    attrs[:first_name] = generate :first_name

    put teacher_teachers_path(@teacher.id), params: { teacher: attrs }
    assert_response :redirect

    @teacher.reload
    assert_equal attrs[:first_name], @teacher.first_name
  end
end
