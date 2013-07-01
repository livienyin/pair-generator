class AddGroupingIdToGroupingParticipants < ActiveRecord::Migration
  def change
    add_column :grouping_participants, :grouping_id, :integer
  end
end
