class UserHasPosts < ActiveRecord::Migration
  def change
    add_column :users, :post_tags_id, :integer
  end
end
