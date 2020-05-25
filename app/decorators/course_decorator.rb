class CourseDecorator < ApplicationDecorator
  def created_at
    object.created_at.strftime('%d-%m-%Y %I:%M')
  end

  def updated_at
    object.updated_at.strftime('%d-%m-%Y %I:%M')
  end
end
