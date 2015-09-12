class AlterAccountRecordIncomingOrOutgingDataType < ActiveRecord::Migration
  def up
    change_column :account_records, :incoming_or_outgoing, :integer
  end
  def down
    change_column :account_records, :incoming_or_outgoing, :boolean
  end
end
