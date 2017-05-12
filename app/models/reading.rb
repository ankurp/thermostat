class Reading < ApplicationRecord
  belongs_to :sensor

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  delegate :location, to: :sensor
  attr_accessor :force_alert

  after_create :create_notification, unless: Proc.new { Notification.for_sensor(self.sensor).exists? }

  validates :humidity, numericality: { :less_than_or_equal_to => 100 }

  mapping do
    indexes :sensor_location, type: 'geo_point'
  end

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
      sensor_location: { lat: sensor.lat, lon: sensor.lon },
      floor: floor.name)
  end

  def create_notification
    return Notification.create(
      sensor: self.sensor,
      reading: self,
      notification_trigger: NotificationTrigger.manual_trigger_for_location(self.location)
    ) if self.force_alert.present?

    NotificationTrigger.not_manual
      .for_location(self.location)
      .select { |t| t.triggered_for_reading?(self) }
      .each do |t|
      Notification.create(
        sensor: self.sensor,
        reading: self,
        notification_trigger: t
      )
    end
  end
end
