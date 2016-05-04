class RenameAccountRecordRecordType < ActiveRecord::Migration
  def change
    rename_column :account_records, :record_type, :record_type_id
  end
end
