require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test 'should create admin' do
    admin = build :admin
    admin.save

    created_admin = Admin.last
    assert created_admin
  end

  test 'should not create admin with empty email' do
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
    admin = build :admin, email: 'john@doe.com'
    assert admin.save

    admin = build :admin, email: 'john@doe'
    assert_not admin.save

    admin = build :admin, email: 'John Does <john@doe.com>'
    assert_not admin.save

    admin = build :admin, email: 'admin@admin_admin'
    assert_not admin.save

    admin = build :admin, email: 'admin_admin_admin'
    assert_not admin.save
  end

  test 'should not create incorrect role' do
    admin = build :admin, role: 'any role'
    admin.save
    
    created_admin = Admin.last
    assert_not created_admin

  end

  test 'should not create incorrect state' do
    admin = build :admin, state: 'any state'
    admin.save

    created_admin = Admin.last
    assert_not created_admin
  end

  test 'should del admin' do
    admin = create :admin
    admin.del

    admin.reload
    assert_equal 'deleted', admin.state
  end
end
