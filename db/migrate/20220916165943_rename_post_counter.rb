class RenamePostCounter < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :post_counter, :posts_counter
  end
end
