module PeopleHelper

  def self.generate_groupings
    ungrouped_people = Person.all.sort_by do |person|
      selected_teammate = person.get_teammate_with_most_distant_grouping_date
      if selected_teammate.nil?
        Grouping.minimum_date
      else
        person.get_most_recent_grouping_date(selected_teammate) || DateTime.now
      end
    end
    groupings = []
    stragglers = []
    while !ungrouped_people.empty?
      first_person = ungrouped_people.shift
      ungrouped_teammates = first_person.filter_people_by_teammates(ungrouped_people)
      if ungrouped_teammates.empty?
        stragglers << first_person
      else  
        second_person = first_person.get_person_with_most_distant_grouping_date(ungrouped_teammates)
        ungrouped_people.delete(second_person)
        groupings << [first_person, second_person]
      end
    end
    stragglers.each do |straggler|
      person_for_straggler = straggler.get_teammate_with_most_distant_grouping_date
      groupings.find {|grouping| grouping.include? person_for_straggler} << straggler unless person_for_straggler.nil?
    end
    groupings
  end

  def self.generate_and_persist_groupings_at(date)
    generate_groupings.map do |grouping_members|
      grouping = Grouping.create(:date => date)
      grouping.people = grouping_members
      grouping
    end
  end

  def self.generate_and_persist_groupings_now
    generate_and_persist_groupings_at(DateTime.now)
  end
end
