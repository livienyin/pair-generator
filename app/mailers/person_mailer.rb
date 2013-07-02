class PersonMailer < ActionMailer::Base
  default :from => (ENV['GMAIL_USERNAME'] + "@gmail.com")

  def grouping_notification(person)
    @person = person
    puts "Sending message to #{@person.name} at #{person.email}"
    mail(:to => person.email, :subject => "Weekly 1+1 pairing") unless @person.get_current_grouping.nil?
  end
  
end
