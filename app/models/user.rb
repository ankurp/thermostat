class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :organization
  belongs_to :role

  scope :custodians, -> { joins(:role).where("roles.name = 'Custodian'") }

  def notify(notification)
    if self.phone_number.present?
      send_sms(notification)
    else
      send_email(notification)
    end
  end

  private

  def send_email(notification)
    UserMailer.sensor_alert(self, notification).deliver_now
  end

  def send_sms(notification)
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    from_number = Rails.application.secrets.twilio_number
    client = Twilio::REST::Client.new account_sid, auth_token

    sms = client.messages.create(
      from: from_number,
      to: self.phone_number,
      body: notification.to_message
    )
  end
end
