class Web::Teacher::Courses::ApplicationController < Web::Teacher::ApplicationController
  def resource_course
    Course.find(params[:course_id])
  end
end
