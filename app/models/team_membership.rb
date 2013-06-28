class TeamMembership < ActiveRecord::Base
  attr_accessible :person_id, :team_id
  belongs_to :person, :foreign_key => :person_id
  belongs_to :team, :foreign_key => :team_id
end
