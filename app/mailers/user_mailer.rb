class UserMailer < ApplicationMailer

  default from: "generalassemblyprojects@gmail.com"
  default to: "generalassemblyprojects@gmail.com"


  def contact_email(name, email, message, booking)
    @name = name
    @email = email
    @message = message
    @booking = booking

    mail( :subject => "Contact form message")
  end

end
