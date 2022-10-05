require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before :each do
    @user = User.create(name: 'Gaby', photo: 'bulma.jpg', bio: 'Systems Engineering Student')
    @post = Post.create(author: @user, title: 'Post 1', text: 'Post One')

    visit user_post_path(@user.id, @post.id)
  end

  it 'shows a post title and the author' do
    title_element = find('.post-title')
    expect(title_element).to have_content("#{@post.title} by #{@user.name}")
  end

  it 'shows comments and likes counts' do
    comments_and_likes = all('.comments-likes')
    comments_and_likes.each do |comment_and_like|
      expect(comment_and_like).to have_content('Comments: ')
      expect(comment_and_like).to have_content(@post.comments_counter.to_s)
      expect(comment_and_like).to have_content('Likes: ')
      expect(comment_and_like).to have_content(@post.likes_counter.to_s)
    end
  end

  it 'shows the post body' do
    post_text = find('.post-text')
    expect(post_text).to have_content(@post.text)
  end

  it 'shows comments of each commentors' do
    comments = @post.comments
    comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
