class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  def recent_posts(n = 3)
    posts.includes(:author).order(created_at: :desc).limit(n)
  end
end
