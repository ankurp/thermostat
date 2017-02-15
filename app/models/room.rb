class Room < ApplicationRecord
  belongs_to :location
  belongs_to :room_type
  belongs_to :floor

  delegate :responsible_users, to: :location

  def full_name
    "#{self.name} - #{self.location.full_name}"
  end
end
