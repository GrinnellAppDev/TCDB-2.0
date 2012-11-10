class AddPayrateToTimeWorked < ActiveRecord::Migration
  def change
    add_column :time_workeds, :payrate, :float
  end
end
