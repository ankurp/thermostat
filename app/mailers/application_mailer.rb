class ApplicationMailer < ActionMailer::Base
  default from: 'Temperature Alert Mailer <sustainablejerseymailer@gmail.com>'
  layout 'mailer'
end
