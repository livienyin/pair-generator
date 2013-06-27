require 'spec_helper'

describe Person do

  let(:person) do
    Person.create!(:name => "Livien", :email => "livienyin@gmail.com")
  end

  let(:team_one) do
    Team.create!(:name => "Frontend")
  end

  let(:team_two) do
    Team.create!(:name => "Backend")
  end

  let!(:team_membership_one) do
    TeamMembership.create!(:person_id => person.id, :team_id => team_one.id)
  end

  let!(:team_membership_two) do
    TeamMembership.create!(:person_id => person.id, :team_id => team_two.id)
  end

  it "has a name attribute" do
    expect(person.name).to eq "Livien"
  end

  it "has an email attribute" do
    expect(person.email).to eq "livienyin@gmail.com"
  end

  it "has many teams" do
    expect(person.teams).to be_an Array
    expect(person.teams.size).to eq 2
    expect(person.teams).to include team_one
    expect(person.teams).to include team_two
  end

  it "has many team memberships" do
    expect(person.team_memberships).to be_an Array
    expect(person.team_memberships.size).to eq 2
    expect(person.team_memberships).to include team_membership_one
    expect(person.team_memberships).to include team_membership_two
  end
  
end

