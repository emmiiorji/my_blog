RSpec.describe 'Users', type: :request do
  it 'responds with correct status users index' do
    get '/users'
    expect(response).to have_http_status(:ok)
  end

  it 'renders correct template for users index' do
    get '/users'
    expect(response).to render_template('index')
  end

  it 'responds with correct status user show' do
    get '/users/:id'
    expect(response).to have_http_status(:ok)
  end

  it 'renders correct template for user show' do
    get '/users/:id'
    expect(response).to render_template('show')
  end
end
