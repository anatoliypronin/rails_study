require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new session page' do
    get new_session_path
    assert_response :success
  end

  test 'should post create new session for admin' do
    admin = create :admin

    post session_path, params: { admin: { email: admin.email, password: 'bad_password' } }
    assert_response :success

    assert_nil session[:admin_id]
  end

  test 'should delete destroy admin session' do
    admin = create :admin
    sign_in_as_admin(admin)

    delete session_path
    assert_response :redirect

    assert_nil session[:admin_id]
  end
end
