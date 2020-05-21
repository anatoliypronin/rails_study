class Web::Admin::ProfilesController < Web::Admin::ApplicationController
  def edit
    @admin = current_admin
  end

  def update
    @admin = current_admin

    if @admin.update(admin_attrs)
      redirect_to admin_root_path
    else
      render action: :edit
    end
  end

  private

  def admin_attrs
    params.require(:admin).permit(:name, :email, :password)
  end
end
