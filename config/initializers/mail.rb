ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => Rails.application.secrets.sendgrid_api_key,
  :domain => ENV["RAILS_ENV"] == "development" ? "localhost" : "heroku.com",
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"
