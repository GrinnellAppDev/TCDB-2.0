class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.datetime :endtime
      t.boolean :filled
      t.integer :lab_id
      t.datetime :starttime
      t.integer :user_id

      t.timestamps
    end
  end
end
