require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test 'should create admin' do
    admin = build :admin
    admin.save

    created_admin = Admin.last
    assert created_admin.persisted?
  end

  test "should not create admin with empty email" do
    admin = build :admin, email: nil
    admin.save

    created_admin = Admin.last
    assert_not created_admin
  end

  test 'email should be unique' do
    first_admin = build :admin, email: 'admin@gmail.com'
    first_admin.save
    second_admin = build :admin, email: 'admin@gmail.com'
    assert_not second_admin.save
  end

  test 'email should be valid' do
    admin = build :admin, email: 'admin_admin_admin'
    assert_not admin.save
  end

  test 'should not create incorrect role' do
    admin = build :admin, role: 'any role'
    assert admin.invalid?
  end

  test 'should not create incorrect state' do
    admin = build :admin, state: 'any state'
    assert admin.invalid?
  end
end
