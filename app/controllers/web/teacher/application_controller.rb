class Web::Teacher::ApplicationController < Web::ApplicationController
  include Pagy::Backend
  layout 'teacher/application'
  before_action :authenticate_teacher!
  helper_method :current_teacher, :teacher_signed_in?
end
