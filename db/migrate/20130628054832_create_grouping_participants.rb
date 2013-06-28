class CreateGroupingParticipants < ActiveRecord::Migration
  def change
    create_table :grouping_participants do |t|

      t.timestamps
    end
  end
end
