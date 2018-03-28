class AddFirstNameAndLastNameAndMobileNoAndIsAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :mobile_no, :integer
    add_column :users, :is_admin, :integer
  end
end
