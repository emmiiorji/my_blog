class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_count

  private

  def update_posts_count
    author.increment!(:posts_counter)
  end

  def recent_comments(num = 5)
    comments.includes(:post).order(created_at: :desc).limit(num)
  end
end
