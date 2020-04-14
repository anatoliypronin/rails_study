class ChangeNameNullOnAdmins < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:admins, :name, false)
  end
end
