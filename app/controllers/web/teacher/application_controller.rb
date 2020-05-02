class Web::Teacher::ApplicationController < Web::ApplicationController
  before_action :authenticate_teacher!
  helper_method :current_teacher, :teacher_signed_in?
end
