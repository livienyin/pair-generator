class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.date :date

      t.timestamps
    end
  end
end
