class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :width
      t.integer :height
      t.integer :filesize
      t.text	:md5
      t.string  :source
      t.integer :nsfw, :default => 0
      t.timestamps

      t.string :raw_tag # what they entered exactly

      t.integer :user_id, :null => false #belongs_to :user
    end
  end
end
