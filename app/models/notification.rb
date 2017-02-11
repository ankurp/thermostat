class Notification < ApplicationRecord
  belongs_to :reading
  belongs_to :sensor
  belongs_to :notification_trigger

  after_create :notify_responsible_user

  delegate :responsible_user, to: :sensor

  scope :for_sensor, -> (sensor) { where(sensor: sensor, is_acknowledged: false) }

  def notify_responsible_user
    responsible_user.notify(self)
  end

  def acknowledge!
    self.update_attribute(:is_acknowledged, true)
  end

end
