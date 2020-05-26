class Web::Admin::ApplicationController < Web::ApplicationController
  layout 'admin/application'
  before_action :authenticate_admin!
  helper_method :current_admin, :admin_signed_in?

  rescue_from Pundit::NotAuthorizedError, with: :forbidden

  def forbidden
    redirect_to admin_root_path
  end

  def current_user
    current_admin
  end
end
