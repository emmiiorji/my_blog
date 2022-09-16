class Post < ApplicationRecord
  belongs_to: user, class_name: 'User'
  has_many: comments
  has_many: likes

  private

  def update_posts_count
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments(n = 5)
    comments.includes(:post).order(created_at: :desc).limit(n)
  end
end
