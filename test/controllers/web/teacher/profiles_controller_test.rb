require 'test_helper'

class Web::Teacher::ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher = create :teacher
    sign_in_as_teacher(@teacher)
  end

  test 'should get edit teacher page' do
    get edit_teacher_profile_path(@teacher.id)
    assert_response :success
  end

  test 'should put update teacher' do
    attrs = {}
    attrs[:first_name] = generate :first_name

    put teacher_profile_path(@teacher.id), params: { teacher: attrs }
    assert_response :redirect

    @teacher.reload
    assert_equal attrs[:first_name], @teacher.first_name
  end
end
