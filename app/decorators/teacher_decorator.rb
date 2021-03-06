class TeacherDecorator < ApplicationDecorator
  def name
    object.first_name + ' ' + object.last_name
  end

  def created_at
    object.created_at.strftime('%d-%m-%Y %I:%M')
  end
end
