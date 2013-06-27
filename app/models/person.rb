class Person < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :team_memberships
  has_many :teams, :through => :team_memberships
end
