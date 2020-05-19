class ApplicationController < ActionController::Base
  include Pagy::Backend
  
  include AuthHelper
  include Pundit
end
