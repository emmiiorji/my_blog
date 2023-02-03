require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  before :each do
    @user = User.create(name: 'Gaby', photo: 'bulma.jpg', bio: 'Systems Engineering Student')
    @post1 = Post.create(author: @user, title: 'Post 1', text: 'Post One')
    post2 = Post.create(author: @user, title: 'Post 2', text: 'Post Two')
    post3 = Post.create(author: @user, title: 'Post 3', text: 'Post Three')
    post4 = Post.create(author: @user, title: 'Post 4', text: 'Post Four')
    @posts = [post2, post3, post4]
    visit user_posts_path(@user.id)
  end

  it "shows user's profile picture" do
    expect(page).to have_selector("img[src*='#{@user.photo}']")
  end

  it "shows the user's username" do
    expect(page).to have_content(@user.name.to_s)
  end

  it 'shows the number of posts the user has written.' do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end

  it 'shows a post title' do
    @posts.each do |post|
      expect(page).to have_content(post.text[..200].to_s)
    end
  end

  it 'shows part of the post body' do
    @posts.each do |post|
      expect(page).to have_content(post.text)
    end
  end

  it 'displays the first comments in a post' do
    comments = @post1.comments
    comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'shows comments and likes counts' do
    comments_and_likes = all('.comments-likes')
    comments_and_likes.each do |comment_and_like|
      expect(comment_and_like).to have_content('Comments: ')
      expect(comment_and_like).to have_content(@post1.comments_counter.to_s)
      expect(comment_and_like).to have_content('Likes: ')
      expect(comment_and_like).to have_content(@post1.likes_counter.to_s)
    end
  end

  it "redirects to that post's show page after clicking a post" do
    find("a[href='#{user_post_path(@user.id, @post1.id)}']").click
    expect(page).to have_selector("input[type='submit'][value='Like']")
  end
end
