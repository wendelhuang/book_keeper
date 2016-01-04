class CreateRecordTypes < ActiveRecord::Migration
  def change
    create_table :record_types do |t|
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
