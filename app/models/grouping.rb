class Grouping < ActiveRecord::Base
  attr_accessible :date
  has_many :grouping_participants
  has_many :people, :through => :grouping_participants

  # def self.groupings_including(participants)
  #   join(:grouping_participants)
  # end
end
