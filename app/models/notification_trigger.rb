class NotificationTrigger < ApplicationRecord
  belongs_to :sensor_type
  belongs_to :location

  enum trigger_when: [:greater_than, :less_than, :manually_reported]

  scope :for_location, -> (location) { where(location: location) }
  scope :not_manual, -> { where(trigger_when: [:greater_than, :less_than]) }

  def self.manual_trigger_for_location(location)
    NotificationTrigger.manually_reported
      .for_location(location)
      .first ||
    NotificationTrigger.new(
      sensor_type: SensorType.temperature,
      location: location,
      trigger_when: :manually_reported)
  end


  def triggered_for_reading?(reading)
    limit_value = self.sensor_value
    reading_value = reading.send(self.sensor_type.name)

    if self.greater_than?
      reading_value > limit_value
    elsif self.less_than?
      reading_value < limit_value
    else
      false
    end
  end

end
