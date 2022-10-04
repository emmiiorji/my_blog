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

  it 'shows the right content' do
    expect(page).to have_content(@user.name)
    expect(page).to have_css("img[src*='#{@user.photo}']")
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    expect(page).to have_content(@user.bio)
  end

  it 'shows the three posts' do
    @posts.each do |post|
      expect(page).to have_content(post.title)
    end
    expect(page).to_not have_content(@post1.title)
  end

  # it 'check the presence of the posts button' do
  #   button = find("#{@posts_url} button")
  #   expect(button).to have_text('See all posts')
  #   expect(page).to have_selector(@posts_url)
  # end

  # it 'changes to post page after clicking on the See all posts button' do
  #   find(@posts_url).click
  #   new_post_anchor = find("a[href='#{new_user_post_path(@user.id)}']")
  #   expect(new_post_anchor).to have_content('New Post')
  # end
end
