class ChangeDateFormatInGrouping < ActiveRecord::Migration
  def up
    change_column :groupings, :date, :datetime
  end

  def down
    change_column :groupings, :date, :date
  end
end
