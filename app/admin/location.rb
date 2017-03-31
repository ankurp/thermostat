ActiveAdmin.register Location do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :street, :city, :state, :zip_code, :name, :organization_id

controller do
  def new
    @location = Location.new(name: "TCNJ", street: "2000 Pennington Road", city: "Ewing", state: "NJ", zip_code: "08628")
  end
end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
