class Web::Student::WelcomeController < Web::Student::ApplicationController
  def index
    @courses = current_student.courses.decorate
  end
end
