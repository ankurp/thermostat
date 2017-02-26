ActiveAdmin.register Room do

  remove_filter :sensors

  permit_params :location_id, :room_type_id, :name, :floor_id

  controller do
    def scoped_collection
      super.includes location: :organization
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :location, member_label: :full_name
      f.input :room_type
      f.input :floor
    end
    f.actions
  end

end
