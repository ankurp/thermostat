class UserMailer < ApplicationMailer

  def sensor_alert(resources, notification)
    emails = case resources
      when User
        resources.email
      else
        resources.map(&:email)
      end
    @msg = notification.to_message

    mail(to: emails, subject: "Alert")
  end

end
