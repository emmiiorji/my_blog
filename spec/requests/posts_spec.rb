RSpec.describe 'Posts', type: :request do
  it 'responds with correct status posts index' do
    get '/users/:id/posts'
    expect(response).to have_http_status(:ok)
  end

  it 'renders correct template for posts index' do
    get '/users/:id/posts'
    expect(response).to render_template('index')
  end

  it 'responds with correct status post show' do
    get '/users/:id/posts/:id'
    expect(response).to have_http_status(:ok)
  end

  it 'renders correct template for post show' do
    get '/users/:id/posts/:id'
    expect(response).to render_template('show')
  end
end

RSpec.describe 'Posts', type: :feature do
  it 'response body includes correct placeholder text for posts index' do
    visit '/users/:id/posts'
    expect(page).to have_text('This is a list of posts')
  end

  it 'response body includes correct placeholder text for post show' do
    visit '/users/:id/posts/:id'
    expect(page).to have_text('This is a single post')
  end
end
