class UserMailer < ApplicationMailer

  default from: "o.johnkupoluyi@gmail.com"
  default to: "o.johnkupoluyi@gmail.com"


  def contact_email(name, email, message, booking)
    @name = name
    @email = email
    @message = message
    @booking = booking

    mail( :subject => "Contact form message")
  end

  def confirm_reservation user, reservation
    @user = user
    @reservation = reservation

    mail(:subject => "Booking Confirmation")
  end

end
