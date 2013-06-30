class Person < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :team_memberships
  has_many :grouping_participants
  has_many :teams, :through => :team_memberships
  has_many :groupings, :through => :grouping_participants

  def get_all_teammates
    teammates = teams.map {|team| team.people}.flatten.uniq {|teammate| teammate.id}
    teammates.delete(self)
    teammates
  end

  def filter_people_by_teammates(people)
    teammates = get_all_teammates
    people.select {|person| teammates.include? person}
  end
  
  def get_teammate_with_most_distant_grouping_date
    get_person_with_most_distant_grouping_date(get_all_teammates)
  end

  def get_person_with_most_distant_grouping_date(people)
    people.min_by do |person|
      most_recent_grouping_date = get_most_recent_grouping_date(person)
      most_recent_grouping_date = Grouping.minimum(:date) - 1 if most_recent_grouping_date.nil?
      most_recent_grouping_date
    end
  end

  def get_most_recent_grouping_date(person)
    groupings_with(person).maximum :date
  end

  def groupings_with(person)
    groupings.joins(:people).where(:people => {:id => person.id})
  end
end
