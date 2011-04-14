class AddCommentCountToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :comment_count, :int
  end

  def self.down
    remove_column :posts, :comment_count
  end
end
