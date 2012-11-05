class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.boolean :filled
      t.integer :labid
      t.integer :userid
      t.timestamp :starttime
      t.timestamp :endtime

      t.timestamps
    end
  end
end
