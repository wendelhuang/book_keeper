class AddImageToRecordTypes < ActiveRecord::Migration
  def up
    add_attachment :record_types, :image
  end
  def down 
    remove_attachment :record_types, :image
  end
end
