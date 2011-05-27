# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Html5snippets::Application.initialize!


ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => '25',
  :domain => "html5snippets.com",
  :authentication => :plain,
  :user_name => "rbreve@gmail.com",
  :password => "asylum02"
}