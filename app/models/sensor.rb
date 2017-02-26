class Sensor < ApplicationRecord
  self.primary_key = 'uuid'

  belongs_to :room
  has_many :readings, dependent: :destroy

  delegate :location, to: :room
  delegate :responsible_users, to: :room
end
