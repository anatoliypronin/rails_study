class Web::Admin::ApplicationController < Web::ApplicationController
  before_action :authenticate_admin!
  helper_method :current_admin, :admin_signed_in?
end
