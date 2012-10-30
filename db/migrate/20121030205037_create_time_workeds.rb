class CreateTimeWorkeds < ActiveRecord::Migration
  def change
    create_table :time_workeds do |t|
      t.integer :labid
      t.integer :userid
      t.timestamp :starttime
      t.timestamp :endtime
      t.string :comment
      t.integer :shiftid

      t.timestamps
    end
  end
end
