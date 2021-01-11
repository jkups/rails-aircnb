class UserMailer < ApplicationMailer

  default to: "generalassemblyprojects@gmail.com"

def contact_email
  @user = user #@user will be whatever user we pass in to the 'welcome' method
  mail( :to => "generalassemblyprojects@gmail.com", :subject => "Welcome to Badgertown!")
end

end
