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

RSpec.describe 'Users', type: :feature do
  it 'response body includes correct placeholder text for users index' do
    visit '/users'
    expect(page).to have_text('This is a list of users')
  end

  it 'response body includes correct placeholder text for user show' do
    visit '/users/:id'
    expect(page).to have_text('This is a single user')
  end
end
