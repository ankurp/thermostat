ActiveAdmin.register Sensor do

  config.filters = false

  controller do
    def scoped_collection
      super.includes room: { location: :organization }
    end
  end

  form do |f|
    inputs 'Details' do
      input :uuid, label: "UUID (MAC Address)"
      input :name, label: "Name"
      input :room, label: "Room", member_label: :full_name
    end
    actions
  end

  permit_params :uuid, :room_id, :name

end
