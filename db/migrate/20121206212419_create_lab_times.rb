class CreateLabTimes < ActiveRecord::Migration
  def change
    create_table :lab_times do |t|
      t.timestamp :open
      t.timestamp :close
      t.integer :lab_id
      t.integer :day_of_week

      t.timestamps
    end
  end
end
