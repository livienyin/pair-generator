class Grouping < ActiveRecord::Base
  attr_accessible :date
  has_many :grouping_participants
  has_many :people, :through => :grouping_participants
end
