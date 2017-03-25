class Notification < ApplicationRecord
  belongs_to :reading
  belongs_to :sensor
  belongs_to :notification_trigger

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  after_create :notify_responsible_users

  delegate :responsible_users, to: :sensor

  scope :for_sensor, -> (sensor) { where(sensor: sensor, is_acknowledged: false) }

  def self.acknowledge_all!
    where(is_acknowledged: false).update_all(is_acknowledged: true)
  end

  def notify_responsible_users
    UserMailer.sensor_alert(responsible_users, self).deliver_now
  end

  def as_indexed_json(options={})
    room = sensor.room
    location = room.location
    floor = room.floor
    organization = location.organization

    {
      sensor_name: sensor.name,
      room_name: room.name,
      location_name: location.name,
      organization_name: organization.name,
      notification_trigger: notification_trigger.trigger_when,
      sensor_value: notification_trigger.sensor_value,
      floor: floor.name,
      created_at: created_at
    }
  end

  def acknowledge!
    self.update_attribute(:is_acknowledged, true)
  end

  def to_message
    sensor_name = self.sensor.name
    room_name = self.sensor.room.name
    trigger = self.notification_trigger
    sensor_type = trigger.sensor_type.name
    case sensor_type
    when 'temperature'
      reading = "#{self.reading.send(sensor_type).to_farenheit(round: 1)}° Farenheit"
      trigger_value = "#{trigger.sensor_value.to_farenheit(round: 1)}° Farenheit" unless trigger.manually_reported?
    else
      reading = self.reading.send(sensor_type).round(1)
      trigger_value = trigger.sensor_value unless trigger.manually_reported?
    end

    if trigger.manually_reported?
      [
        "#{room_name} Manually Triggered #{sensor_type.humanize} Alert",
        [
          "Sensor #{sensor_name} in #{room_name} had a #{sensor_type} reading of #{reading}.",
          'This was a manual trigger.'
        ].join(' ')
      ]
    else
      triggered_when = trigger.trigger_when.humanize.downcase

      [
        "#{room_name} #{sensor_type.humanize} Alert - #{reading}",
        [
          "Sensor #{sensor_name} in #{room_name} had a #{sensor_type} reading of #{reading}.",
          "This was triggered because #{sensor_type} was #{triggered_when} #{trigger_value}."
        ].join(' ')
      ]
    end
  end

end
