class AdminDecorator < ApplicationDecorator
  def name_and_email
    object.name + ' ' + object.email
  end

  def created_at
    object.created_at.strftime('%d/%m/%y')
  end
end
