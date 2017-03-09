class UserMailer < ApplicationMailer

  def sensor_alert(resources, notification)
    emails = case resources
      when User
        resources.email
      else
        resources.map(&:email)
      end
    subject, @msg = notification.to_message

    mail(to: emails, subject: subject)
  end

end
