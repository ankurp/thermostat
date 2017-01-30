class Location < ApplicationRecord
  belongs_to :organization
  has_many :rooms

  delegate :responsible_user, to: :organization
end
