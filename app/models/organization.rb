class Organization < ApplicationRecord
  has_many :locations
  has_many :users

  def responsible_users
    self.users.custodians
  end
end
