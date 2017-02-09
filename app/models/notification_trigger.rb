class NotificationTrigger < ApplicationRecord
  belongs_to :sensor_type
  belongs_to :location

  enum trigger_when: [:greater_than, :less_than, :manually_reported]

  scope :for_location, -> (location) { where(location: location) }

  def self.manual_trigger_for_location(location)
    NotificationTrigger
      .manually_reported
      .for_location(location)
      .first ||
    NotificationTrigger.new(
      sensor_type: SensorType.temperature,
      location: location,
      trigger_when: :manually_reported)
  end

end
