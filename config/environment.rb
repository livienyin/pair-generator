# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
OnePlusOne::Application.initialize!

OnePlusOne::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "google.com",
    :user_name => "livienyin",
    :password => ENV['GMAIL_PASSWORD'],
    :authentication => "plain",
    :enable_starttls_auto => true,
  }
  # DO care
  config.action_mailer.raise_delivery_errors = true
end
