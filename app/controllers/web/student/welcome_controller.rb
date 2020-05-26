class Web::Student::WelcomeController < Web::Student::ApplicationController
  def index
    @courses = Course.where(state: 'active').decorate
  end
end
