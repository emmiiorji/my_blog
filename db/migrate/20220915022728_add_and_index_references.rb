class AddAndIndexReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, foreign_key: true

    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :post, foreign_key: true
  
    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :post, foreign_key: true
    
    rename_column :posts, :user_id, :author_id
    rename_column :likes, :user_id, :author_id
    rename_column :comments, :user_id, :author_id
  end
end
