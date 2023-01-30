class MakeSomeColumnsNonNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :likes, :author_id, false
    change_column_null :likes, :post_id, false
    change_column_null :posts, :author_id, false
    change_column_null :comments, :author_id, false
    change_column_null :comments, :post_id, false
    
    change_column_null :comments, :text, false
    change_column_null :posts, :title, false
    change_column_null :posts, :text, false
    change_column_null :users, :name, false
    change_column_null :users, :bio, false
  end
end
