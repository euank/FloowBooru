class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags, :id => false do |t|
      t.integer :post_id
      t.integer :tag_id
    end
  end
end
