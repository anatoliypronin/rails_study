class CourseDecorator < ApplicationDecorator
  def created_at
    object.created_at.strftime('%d/%m/%y')
  end
end
