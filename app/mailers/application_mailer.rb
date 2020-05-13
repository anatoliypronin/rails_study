class ApplicationMailer < ActionMailer::Base
  default from: "#{configatron.email}"
  layout 'mailer'
end
