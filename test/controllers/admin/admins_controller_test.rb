require 'test_helper'

class Admin::AdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
  end

  test 'should get index admins page' do
    get admin_admins_path
    assert_response :success
  end

  test 'should get new admin page' do
    get new_admin_admin_path
    assert_response :success
  end

  test 'should post create admin' do
    admin_attrs = attributes_for :admin

    post admin_admins_path, params: { admin: admin_attrs }
    assert_response :redirect

    admin = Admin.last
    assert_equal admin_attrs[:email], admin.email
  end

  test 'should not post create admin' do
    admin_attrs = attributes_for :admin, email: nil

    post admin_admins_path, params: { admin: admin_attrs }
    assert_response :success

    admin = Admin.find_by(email: admin_attrs[:email])
    assert_nil admin
  end

  test 'should get show admin page' do
    get admin_admin_path(@admin.id)
    assert_response :success
  end

  test 'should get edit admin page' do
    get edit_admin_admin_path(@admin.id)
    assert_response :success
  end

  test 'should put update admin' do
    attrs = {}
    attrs[:name] = generate :name

    attrs[:password] = '123456'
    put admin_admin_path(@admin.id), params: { admin: attrs }
    assert_response :redirect

    @admin.reload
    assert_equal attrs[:name], @admin.name
  end

  test 'should state del  admin' do
    put admin_admin_del_path(@admin)
    assert_response :redirect

    @admin.reload
    assert_equal 'deleted', @admin.state
  end

  test 'should state active admin' do
    @admin = create :admin, :del
    put admin_admin_restore_path(@admin.id)
    assert_response :redirect

    @admin.reload
    assert_equal 'active', @admin.state
  end
end
