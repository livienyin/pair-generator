class PersonMailer < ActionMailer::Base
  default :from => "livienyin@gmail.com"

  def grouping_notification(person)
    @person = person
    mail(:to => person.email, :subject => "Weekly 1+1 pairing") unless @person.get_current_grouping.nil?
  end
  
end
