class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :munged
      t.string :login
      t.string :password
      t.integer :age
      t.boolean :sex
      t.string :email
      t.string :mobile

      t.timestamps
    end
  end
end
