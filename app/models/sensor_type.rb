class SensorType < ApplicationRecord

  scope :temperature, -> { SensorType.where(name: "temperature").first }

end
