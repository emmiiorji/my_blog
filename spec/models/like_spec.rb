require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    test_user = User.create(name: 'Emmanuel', bio: 'Microverse student', posts_counter: 0)
    test_post = Post.create(author: test_user, title: 'My first post', text: 'Hello World', comments_counter: 0,
                            likes_counter: 0)
    Like.create(author: test_user, post: test_post)
  end
  before { subject.save }

  it 'updates_Likes increases post likes_counter by one' do
    expect(subject.post.likes_counter).to be 1
  end
end
