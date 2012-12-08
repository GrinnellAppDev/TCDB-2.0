class CreateShiftTimes < ActiveRecord::Migration
  def change
    create_table :shift_times do |t|
      t.timestamp :start
      t.timestamp :end
      t.integer :lab_id

      t.timestamps
    end
    add_index :shift_times, :lab_id
  end
end
