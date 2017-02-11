ActiveAdmin.register Notification do
  config.filters = false

  permit_params :sensor_id, :reading_id, :is_acknowledged, :notification_trigger_id

  actions :all, except: [:edit]

  controller do
    def scoped_collection
      super.includes :reading, :sensor, :notification_trigger
    end
  end

  index do
    column :id
    column :is_acknowledged
    column :created_at
    column :reading
    column :sensor
    column :notification_trigger
    actions do |notification|
      link_to 'Acknowledge', acknowledge_admin_notification_path(notification), method: :patch
    end
  end

  member_action :acknowledge, method: :patch do
    resource.acknowledge!
    redirect_to resource_path, notice: "Notification Acknowledged!"
  end
end
