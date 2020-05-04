class TeacherObserver < ActiveRecord::Observer
    observe :teacher
  
    def after_save(record)
      TeacherMailer.welcome_email(record).deliver_now
    end
  end
  