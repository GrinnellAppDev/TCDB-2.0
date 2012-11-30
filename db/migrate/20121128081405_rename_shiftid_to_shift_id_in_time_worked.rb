class RenameShiftidToShiftIdInTimeWorked < ActiveRecord::Migration
  def up
  	rename_column :time_workeds, :shiftid, :shift_id
  end

  def down
  	rename_column :time_workeds, :shift_id, :shiftid
  end
end
