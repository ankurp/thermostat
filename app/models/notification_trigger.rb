class NotificationTrigger < ApplicationRecord
  belongs_to :sensor_type
  belongs_to :location

  enum trigger_when: [:greater_than, :less_than]
end
