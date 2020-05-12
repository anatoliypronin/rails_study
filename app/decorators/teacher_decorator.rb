class TeacherDecorator < ApplicationDecorator
  delegate_all

  def name_and_email
    object.first_name + " " + object.last_name
  end
end
