require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    test_user = User.create(name: 'Emmanuel', bio: 'Microverse student', posts_counter: 0)
    test_post = Post.create(author_id: test_user.id, title: 'My first post', text: 'I am posting now', comments_counter: 0,
                            likes_counter: 0)
    Like.create(author: test_user, post_id: test_post.id)
  end
  before { subject.save }

  it 'updates_Likes increases post likes_counter by one' do
    puts subject.instance_variables
    expect(Post.find(subject.post_id).likes_counter).to be 1
  end
end
