class WcMailer < ApplicationMailer
  default from: "jon.foster.ny@gmail.com"

  def multiple_emails(email)
    mail(
      to: email[:email],
      subject: email[:subject],
      body: email[:body]
    )
  end
end
