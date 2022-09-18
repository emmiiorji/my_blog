require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    test_user = User.create(name: 'Emmanuel', bio: 'Microverse student', posts_counter: 0)
    test_post = Post.create(author: test_user, title: 'My first post', text: 'Hello world', comments_counter: 0,
                            likes_counter: 0)
    Comment.new(author: test_user, post: test_post, text: 'It is a great post. Thanks')
  end
  before { subject.save }

  it 'updates post comment counter' do
    expect(subject.post.comments_counter).to eq 1
  end
  it 'has commentor as Emmanuel' do
    expect(subject.post.author.name).to eq 'Emmanuel'
  end
end
