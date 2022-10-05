require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  before :each do
    @user = User.create(
      name: 'Gaby',
      photo: 'bulma.jpg',
      bio: 'Systems Engineering Student'
    )
    @post1 = Post.create(author: @user, title: 'Post 1', text: 'Post One')
    post2 = Post.create(author: @user, title: 'Post 2', text: 'Post Two')
    post3 = Post.create(author: @user, title: 'Post 3', text: 'Post Three')
    post4 = Post.create(author: @user, title: 'Post 4', text: 'Post Four')
    @posts = [post2, post3, post4]
    @posts_url = "a[href = '#{user_posts_path(@user.id)}']"

    visit user_path(@user.id)
  end
end
