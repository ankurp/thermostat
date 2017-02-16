class Reading < ApplicationRecord
  belongs_to :sensor

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  delegate :location, to: :sensor
  attr_accessor :force_alert

  after_create :should_create_notification?

  def as_indexed_json(options={})
    room = sensor.room
    location = room.location
    floor = room.floor
    organization = location.organization

    self.as_json.merge(
      sensor_name: sensor.name,
      room_name: room.name,
      location_name: location.name,
      organization_name: organization.name,
      floor: floor.name)
  end

  def should_create_notification?
    return if Notification.for_sensor(self.sensor).exists?
    return Notification.create(
      sensor: self.sensor,
      reading: self,
      notification_trigger: NotificationTrigger.manual_trigger_for_location(self.location)
    ) if self.force_alert.present?

    NotificationTrigger.for_location(self.location).each do |trigger|
      limit_value = trigger.sensor_value
      reading_value = self.send(trigger.sensor_type.name)

      create_notification = if trigger.greater_than?
        reading_value > limit_value
      elsif trigger.less_than?
        reading_value < limit_value
      end
      
      Notification.create(
        sensor: self.sensor,
        reading: self,
        notification_trigger: trigger
      ) if create_notification
    end
  end
end
