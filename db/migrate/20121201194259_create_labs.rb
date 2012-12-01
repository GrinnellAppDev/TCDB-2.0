class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.integer :lab_id
      t.string :labname

      t.timestamps
    end
  end
end
