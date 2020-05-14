require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  test 'welcome email for admin' do
    admin = create :admin

    email = AdminMailer.welcome_email(admin)
    assert_emails 1 do
      email.deliver_now
    end
    assert_equal [admin.email], email.to
    assert_equal [configatron.email], email.from
    assert_equal I18n.t('admin_mailer.welcome_email.subject', deep_interpolation: true, name: admin.name.to_s), email.subject
  end
end
