require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  test 'welcome email for admin' do
    admin = create :admin

    email = AdminMailer.welcome_email(admin)
    assert_emails 1 do
      email.deliver_now
    end
    assert_equal [admin.email], email.to
    assert_equal ['from@example.com'], email.from
    assert_equal "Добро пожаловать, #{admin.name}!", email.subject
  end
end
