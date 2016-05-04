class ChangeAccountRecordRecordType < ActiveRecord::Migration
  def up
    change_column :account_records, :record_type, :integer
  end
  def down
    change_column :account_records, :record_type, :string
  end
end
