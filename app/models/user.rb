class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # User::Roles
  # The available roles
  ROLES = %i[admin default].freeze

  def recent_posts(num = 3)
    Post.where(author: self).order(updated_at: :desc).limit(num)
  end

  def is?(requested_role)
    role == requested_role.to_s
  end
end