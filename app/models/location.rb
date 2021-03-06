class Location < ApplicationRecord
  belongs_to :organization
  has_many :rooms, dependent: :destroy

  delegate :responsible_users, to: :organization

  def full_name
    "#{self.name} - #{self.organization.name}"
  end
end
