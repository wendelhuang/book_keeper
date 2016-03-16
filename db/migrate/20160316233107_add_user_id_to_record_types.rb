class AddUserIdToRecordTypes < ActiveRecord::Migration
  def change
    add_column :record_types, :user_id, :integer
  end
end
