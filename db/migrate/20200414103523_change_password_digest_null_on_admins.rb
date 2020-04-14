class ChangePasswordDigestNullOnAdmins < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:admins, :password_digest, false)
  end
end
