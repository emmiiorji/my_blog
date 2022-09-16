class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments
  has_many :likes

  private

  def update_posts_count
    author.increment!(:posts_counter)
  end

  def recent_comments(num = 5)
    comments.includes(:post).order(created_at: :desc).limit(num)
  end
end
