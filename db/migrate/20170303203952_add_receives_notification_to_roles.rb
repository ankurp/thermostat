class AddReceivesNotificationToRoles < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :receives_notification, :boolean
  end
end
