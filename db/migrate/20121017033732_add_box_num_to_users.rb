class AddBoxNumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :boxNum, :string
  end
end
