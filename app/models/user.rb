class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :organization

  def notify(notification)
    if self.phone_number.present?
      account_sid = Rails.application.secrets.twilio_sid
      auth_token = Rails.application.secrets.twilio_token
      from_number = Rails.application.secrets.twilio_number
      client = Twilio::REST::Client.new account_sid, auth_token

      sensor_name = notification.sensor.name
      room_name = notification.sensor.room.name
      trigger = notification.notification_trigger
      sensor_type = trigger.sensor_type.name
      reading = notification.reading.send(sensor_type).to_farenheit(round: 1)
      if trigger.manually_reported?
        msg = "Sensor #{sensor_name} in Room #{room_name} had a reading of #{reading} for #{sensor_type}. This was a manual trigger."
      else
        triggered_when = trigger.trigger_when.humanize.downcase
        trigger_value = trigger.sensor_value.to_farenheit(round: 1)
        msg = "Sensor #{sensor_name} in Room #{room_name} had a reading of #{reading} for #{sensor_type}. This was triggered because #{sensor_type} was #{triggered_when} #{trigger_value}."
      end

      sms = client.messages.create(
        from: from_number,
        to: self.phone_number,
        body: msg
      )
    end
  end
end
