class Web::Student::WelcomeController < Web::Student::ApplicationController
  def index
    @courses = Course.where(state: 'active').order(updated_at: :desc).decorate
  end
end
