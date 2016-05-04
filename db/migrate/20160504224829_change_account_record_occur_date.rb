class ChangeAccountRecordOccurDate < ActiveRecord::Migration
  def up
    change_column :account_records, :occur_date, :datetime
  end
  def down
    change_column :account_records, :occur_date, :date
  end
end
