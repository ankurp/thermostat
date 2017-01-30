class Reading < ApplicationRecord
  belongs_to :sensor

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  delegate :location, to: :sensor

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :temperature, type: :float
      indexes :humidity, type: :float
      indexes :updated_at, type: :date
      indexes :sensor_id, analyzer: 'keyword'
      indexes :room_name, analyzer: 'keyword'
      indexes :location_name, analyzer: 'keyword'
      indexes :organization_name, analyzer: 'keyword'
    end
  end

  after_create :should_create_notification?

  def as_indexed_json(options={})
    room = sensor.room
    location = room.location
    organization = location.organization

    self.as_json.merge(
      sensor_name: sensor.name,
      room_name: room.name,
      location_name: location.name,
      organization_name: organization.name)
  end

  def should_create_notification?
    if Notification.where(sensor: self.sensor, is_acknowledged: false).exists?
      return
    end

    NotificationTrigger.where(location: self.location).each do |trigger|
      limit_value = trigger.sensor_value
      reading_value = self.send(trigger.sensor_type.name)

      create_notification = if trigger.greater_than?
        reading_value > limit_value
      else
        reading_value < limit_value
      end

      if create_notification
        Notification.create(sensor: self.sensor, reading: self, notification_trigger: trigger)
      end
    end
  end
end
