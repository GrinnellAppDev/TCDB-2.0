class AddPCardToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pCard, :string
  end
end
