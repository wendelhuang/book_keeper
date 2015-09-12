class CreateAccountRecords < ActiveRecord::Migration
  def change
    create_table :account_records do |t|
      t.integer :user_id
      t.decimal :amounts, :precision => 10, :scale => 3
      t.boolean :incoming_or_outgoing
      t.integer :record_type
      t.date :occur_date
      t.text :description

      t.timestamps
    end
  end
end
