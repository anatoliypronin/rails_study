class TeacherMailer < ApplicationMailer
  def welcome_email(teacher)
    @teacher = teacher
    mail(to: @teacher.email, subject: default_i18n_subject(name: teacher.first_name))
  end
end
