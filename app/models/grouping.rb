class Grouping < ActiveRecord::Base
  attr_accessible :date
  has_many :grouping_participants
  has_many :people, :through => :grouping_participants

  def self.minimum_date
    ((self.minimum(:date) || DateTime.now) - 1.day)
  end

end
