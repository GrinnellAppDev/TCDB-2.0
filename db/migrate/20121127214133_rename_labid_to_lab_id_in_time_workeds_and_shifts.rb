class RenameLabidToLabIdInTimeWorkedsAndShifts < ActiveRecord::Migration
  def up
  	rename_column :time_workeds, :labid, :lab_id
  	rename_column :shifts, :labid, :lab_id

  end

  def down
  	rename_column :time_workeds, :lab_id, :labid
  	rename_column :shifts, :lab_id, :labid
  end
end
