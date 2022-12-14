class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  after_save :update_likes_count

  validates :author, uniqueness: { scope: :post }

  private

  def update_likes_count
    post.increment!(:likes_counter)
  end
end
