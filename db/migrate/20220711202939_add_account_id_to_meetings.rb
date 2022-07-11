class AddAccountIdToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :account_id, :integer
    add_index :meetings, :account_id
    add_column :meetings, :doctor, :integer
  end
end
