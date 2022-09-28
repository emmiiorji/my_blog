require 'rails_helper'

RSpec.describe Post do
  it 'responds with correct status posts index' do
    get '/users/:id/posts'
    expect(response).to have_http_status(:ok)
  end
end
