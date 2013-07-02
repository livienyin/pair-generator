namespace :scheduler do
  task :mailing => [:environment, :generate_groups] do
    puts "Starting yay!"
    Person.all.each do |person|
      PersonMailer.grouping_notification(person).deliver
    end
    puts "Emailed everyone."
  end

  task :generate_groups => :environment do
    PeopleHelper.generate_and_persist_groupings_now
  end
end
