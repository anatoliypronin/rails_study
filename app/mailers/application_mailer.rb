class ApplicationMailer < ActionMailer::Base
  default from: configatron.email.to_s
  layout 'mailer'
end
