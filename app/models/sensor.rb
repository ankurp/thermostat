class Sensor < ApplicationRecord
  self.primary_key = 'uuid'

  belongs_to :room
  has_many :readings
end
