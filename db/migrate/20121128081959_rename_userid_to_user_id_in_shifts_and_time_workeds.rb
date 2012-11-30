class RenameUseridToUserIdInShiftsAndTimeWorkeds < ActiveRecord::Migration
  def up
  	rename_column :time_workeds, :userid, :user_id
  	rename_column :shifts, :userid, :user_id
  end

  def down
  	rename_column :time_workeds, :user_id, :userid
  	rename_column :shifts, :user_id, :userid
  end
end
