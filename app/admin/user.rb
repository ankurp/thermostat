ActiveAdmin.register User do
config.filters = false

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :organization_id, :email, :name, :phone_number, :role_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  controller do
    def scoped_collection
      super.includes :organization
      super.includes :role
    end
  end

  index do
    column :name
    column :organization
    column :email
    column :phone_number
    column :role
    actions
  end

end
