require 'test_helper'

class Web::Admin::ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
  end

  test 'should get edit admin page' do
    get edit_admin_profile_path(@admin.id)
    assert_response :success
  end

  test 'should put update admin' do
    attrs = {}
    attrs[:name] = generate :name

    put admin_profile_path(@admin.id), params: { admin: attrs }
    assert_response :redirect

    @admin.reload
    assert_equal attrs[:name], @admin.name
  end
end
