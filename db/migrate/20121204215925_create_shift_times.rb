class CreateShiftTimes < ActiveRecord::Migration
  def change
    create_table :shift_times do |t|
      t.datetime :start
      t.datetime :end
      t.integer :lab_id

      t.timestamps
    end
    add_index :shift_times, :lab_id
  end
end
