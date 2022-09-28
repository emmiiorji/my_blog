require 'rails_helper'

RSpec.describe Post do
  it 'response body includes correct placeholder text for posts index' do
    get '/users/:id/posts'
    expect(page).to have_text('This is a list of posts')
  end
end
