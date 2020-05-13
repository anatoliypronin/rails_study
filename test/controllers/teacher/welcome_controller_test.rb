require 'test_helper'

class Teacher::WelcomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher = create :teacher
    sign_in_as_teacher(@teacher)
  end

  test 'should get welcome page teacher' do
    get teacher_root_path
    assert_response :success
  end
end
