class GroupingParticipant < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :grouping
  has_one :person
end
