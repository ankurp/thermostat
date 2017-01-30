class Sensor < ApplicationRecord
  self.primary_key = 'uuid'

  belongs_to :room
  has_many :readings

  delegate :location, to: :room
  delegate :responsible_user, to: :room
end
