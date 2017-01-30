class Organization < ApplicationRecord
  has_many :locations
  has_many :users

  def responsible_user
    self.users.first
  end
end
