class Room < ApplicationRecord
  belongs_to :location
  belongs_to :room_type
end
