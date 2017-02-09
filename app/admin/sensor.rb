ActiveAdmin.register Sensor do

config.filters = false

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

  form do |f|
    inputs 'Details' do
      input :uuid
      input :name, label: "Name"
      input :room, label: "Room"
    end
    actions
  end

  permit_params :uuid, :room_id, :name
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
