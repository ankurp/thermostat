ActiveAdmin.register Notification do

config.filters = false

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :sensor_id, :reading_id, :is_acknowledged, :notification_trigger_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
form do |f|
  inputs 'Edit Notification' do
    input :is_acknowledged, label: "Acknowleding will allow future notifications to be sent to you"
  end
  para "Until you delete this notification or acknowledge it, you will never receive any other notification alerts being sent from this sensor."
  actions
end

end
