class GroupingParticipant < ActiveRecord::Base
  attr_accessible :grouping_id, :person_id 
  belongs_to :grouping
  belongs_to :person
end
