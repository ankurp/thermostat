class Room < ApplicationRecord
  belongs_to :location
  belongs_to :room_type

  delegate :responsible_user, to: :location
end
