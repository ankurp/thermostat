class Notification < ApplicationRecord
  belongs_to :reading
  belongs_to :sensor
  belongs_to :notification_trigger

  after_create :notify_responsible_users

  delegate :responsible_users, to: :sensor

  scope :for_sensor, -> (sensor) { where(sensor: sensor, is_acknowledged: false) }

  def notify_responsible_users
    UserMailer.sensor_alert(responsible_users, self).deliver_now
  end

  def acknowledge!
    self.update_attribute(:is_acknowledged, true)
  end

  def to_message
    sensor_name = self.sensor.name
    room_name = self.sensor.room.name
    trigger = self.notification_trigger
    sensor_type = trigger.sensor_type.name
    reading = case sensor_type
      when 'temperature'
        "#{self.reading.send(sensor_type).to_farenheit(round: 1)}° Farenheit"
      else
        self.reading.send(sensor_type).round(1)
      end
    if trigger.manually_reported?
      return "Sensor #{sensor_name} in #{room_name} had a reading of #{reading} for #{sensor_type}. This was a manual trigger."
    else
      triggered_when = trigger.trigger_when.humanize.downcase
      trigger_value = trigger.sensor_value.to_farenheit(round: 1)
      return "Sensor #{sensor_name} in #{room_name} had a reading of #{reading} for #{sensor_type}. This was triggered because #{sensor_type} was #{triggered_when} #{trigger_value}."
    end
  end

end
