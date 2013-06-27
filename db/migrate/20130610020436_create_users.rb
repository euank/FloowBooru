class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :salt
      t.text :pass_hash
      t.text :about
      t.timestamps
    end
  end
end
