class AddPersonIdToGroupingParticipants < ActiveRecord::Migration
  def change
    add_column :grouping_participants, :person_id, :integer
  end
end
