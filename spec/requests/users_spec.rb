require 'rails_helper'

RSpec.describe User do
  it 'responds with correct status users index' do
    get '/users'
    expect(response).to have_http_status(:ok)
  end

  it 'renders correct template for users index' do
    get '/users'
    expect(response).to render_template('index')
  end
end
