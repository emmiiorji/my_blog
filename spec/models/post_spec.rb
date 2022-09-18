require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    test_user = User.create(name: 'Morris', posts_counter: 0)
    Post.create(author: test_user, title: 'test_title', text: 'test text', comments_counter: 0, likes_counter: 0)
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

  it 'Update Posts_counter_update to increase on new posts' do
    expect(subject.author.posts_counter).to eq 1
  end

  it 'Top_five length should be between 0 and 5' do
    Comment.create(author: subject.author, post: subject, text: 'thanks for the feed back')
    expect(subject.top_five).to be_kind_of Array
    expect(subject.top_five.length).to be_between(0, 5)
  end
end
