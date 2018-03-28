class CreateLeavelogs < ActiveRecord::Migration
  def change
    create_table :leavelogs do |t|
      t.string :reason_for_leave
      t.string :status
      t.date :leave_date_from
      t.date :leave_date_to
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
