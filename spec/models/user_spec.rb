require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Morris', photo: 'http://', bio: 'Teacher from Ghana') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'bio should be present' do
    subject.bio = nil
    expect { subject.save }.to raise_error(ActiveRecord::NotNullViolation)
  end
end
