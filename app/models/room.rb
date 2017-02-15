class Room < ApplicationRecord
  belongs_to :location
  belongs_to :room_type
  belongs_to :floor

  delegate :responsible_user, to: :location
end
