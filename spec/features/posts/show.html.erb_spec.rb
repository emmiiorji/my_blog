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
end
