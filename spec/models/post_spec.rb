require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    test_user = User.create(name: 'Morris', bio: 'A lovely guy who lives in Nigeria')
    Post.create(author_id: test_user.id, title: 'test_title', text: 'test text')
  end
  before { subject.save }

  it 'should not allow empty title' do
    expect(subject).to be_valid
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be bigger or equal than 0' do
    expect(subject.comments_counter).to be >= 0
  end

  it 'LikesCounter should be bigger or equal than 0' do
    expect(subject.likes_counter).to be >= 0
  end

  # it 'Update Posts_counter_update to increase on new posts' do
  #   expect(subject.author.posts_counter).to eq 1
  # end

  it 'Top_five length should be between 0 and 5' do
    Comment.create(author_id: subject.author_id, post: subject, text: 'thanks for the feed back')
    # expect(subject.recent_comments(5)).to be_kind_of Array
    expect(subject.recent_comments(5).length).to be_between(0, 5)
  end
end
