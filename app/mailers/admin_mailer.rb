class AdminMailer < ApplicationMailer
  def welcome_email(admin)
    @admin = admin
    mail(to: @admin.email, subject: default_i18n_subject(name: admin.name))
  end
end
