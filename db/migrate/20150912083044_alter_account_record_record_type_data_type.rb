class AlterAccountRecordRecordTypeDataType < ActiveRecord::Migration
  def up
    change_column :account_records, :record_type, :string
  end
  def down
    change_column :account_records, :record_type, :integer
  end
end
