class Team < ActiveRecord::Base
  attr_accessible :name
  has_many :team_memberships
  has_many :people, :through => :team_memberships
end
