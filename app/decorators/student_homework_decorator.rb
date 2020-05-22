class StudentHomeworkDecorator < ApplicationDecorator
  def date_begin
    object.date_begin.strftime('%d-%m-%Y %I:%M')
  end

  def date_end
    object.date_end&.strftime('%d-%m-%Y %I:%M')
  end
end
