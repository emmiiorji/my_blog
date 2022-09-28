require 'rails_helper'

RSpec.describe User do
  it 'responds with correct status users index' do
    get '/users'
    expect(response).to have_http_status(:ok)
  end
end
