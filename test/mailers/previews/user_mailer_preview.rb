class UserMailerPreview < ActionMailer::Preview
  def sensor_alert
    UserMailer.sensor_alert(User.first, Notification.last)
  end
end
