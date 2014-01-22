class Contact < ActionMailer::Base
  default from: "admin@garthnix.com"

  def email_garth(name, email, message)
    @name = name
    @message = message

    mail from: email, to: "garth@garthnix.com", subject: "A Message from " + name
  end
end