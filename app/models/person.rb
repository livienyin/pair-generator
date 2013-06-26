class Person < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :teams
end
