class Web::Student::ApplicationController < Web::ApplicationController
    layout 'student/application'
    before_action :authenticate_student!
    helper_method :current_student, :student_signed_in?
  end