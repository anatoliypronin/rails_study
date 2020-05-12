class TeacherDecorator < ApplicationDecorator
  def name
    object.first_name + " " + object.last_name
  end
end
