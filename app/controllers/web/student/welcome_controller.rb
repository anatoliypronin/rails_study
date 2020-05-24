class Web::Student::WelcomeController < Web::Student::ApplicationController
  def index
    @courses = Courses.active.decorate
  end
end
