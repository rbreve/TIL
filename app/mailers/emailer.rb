class Emailer < ActionMailer::Base
  def contact(recipient, subject, message, sent_at = Time.now, header)
       @subject = subject
       @recipients = recipient
       @from = 'no-reply@yourdomain.com'
       @sent_on = sent_at
       @body["title"] = 'Request Received'
      @body["email"] = 'sender@yourdomain.com'
      @body["message"] = message
       @headers["X-SMTPAPI"] = header
    end
end
