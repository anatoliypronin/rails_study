# Preview all emails at http://localhost:3000/rails/mailers/teacher_mailer
class TeacherMailerPreview < ActionMailer::Preview
  def welcome_email
    teacher = FactoryBot.create :teacher
    TeacherMailer.welcome_email(teacher)
  end
end
