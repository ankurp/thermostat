class Location < ApplicationRecord
  belongs_to :organization
  has_many :rooms
end
