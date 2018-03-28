class AddMaxLeaveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :max_leave, :string
  end
end
