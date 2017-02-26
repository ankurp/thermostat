class Organization < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :users, dependent: :destroy

  def responsible_users
    self.users.custodians
  end
end
