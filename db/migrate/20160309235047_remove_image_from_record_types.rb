class RemoveImageFromRecordTypes < ActiveRecord::Migration
  def change
    remove_column :record_types, :image, :string
  end
end
