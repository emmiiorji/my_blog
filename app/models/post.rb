class Post < ApplicationRecord
  belongs_to: user, class_name: 'User'
  has_many: comments
  has_many: likes

  private

  def update_posts_count
    author.update(posts_counter: author.posts.count)
  end
end
