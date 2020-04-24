require 'test_helper'

class Teacher::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get welcome page teacher' do
    get teacher_root_path
    assert_response :success
  end
end