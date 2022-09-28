require 'rails_helper'

RSpec.describe Post do
  it 'response body includes correct placeholder text for posts index' do
    get '/users/:id/posts'
    expect(page).to have_text('This is a list of posts')
  end

  it 'response body includes correct placeholder text for post show' do
    get '/users/:id/posts/:id'
    expect(page).to have_text('This is a single post')
  end
end
