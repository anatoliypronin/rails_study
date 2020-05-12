require 'test_helper'

class TeacherMailerTest < ActionMailer::TestCase
  test 'welcome email for teacher' do
    teacher = create :teacher

    email = TeacherMailer.welcome_email(teacher)
    assert_emails 1 do
      email.deliver_now
    end
    assert_equal [teacher.email], email.to
    assert_equal [configatron.email], email.from
    assert_equal I18n.t('teacher_mailer.welcome_email.subject', deep_interpolation: true, name:
      teacher.first_name.to_s), email.subject
  end
end
