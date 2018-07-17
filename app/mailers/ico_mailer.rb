class IcoMailer < ApplicationMailer
  layout 'plain_mailer'

  def create(ico_request)
    @body = ico_request.inspect

    mail to: 'backoffice@photon.gold', subject: 'ICOの新規申し込みがありました'
  end
end
