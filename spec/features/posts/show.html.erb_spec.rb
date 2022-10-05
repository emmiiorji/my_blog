require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before :each do
    @user = User.create(name: 'Gaby', photo: 'bulma.jpg', bio: 'Systems Engineering Student')
    @post = Post.create(author: @user, title: 'Post 1', text: 'Post One')

    visit user_post_path(@user.id, @post.id)
  end

  # it 'shows username of post commentors' do
  #   comments = @post.comments
  #   comments.each do |comment|
  #     expect(page).to have_content(@user[comment.author_id - 1].name)
  #   end
  # end
end
