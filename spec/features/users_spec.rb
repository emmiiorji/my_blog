require 'rails_helper'

RSpec.describe User do
  it 'response body includes correct placeholder text for users index' do
    visit '/users'
    expect(page).to have_text('This is a list of users')
  end

  it 'response body includes correct placeholder text for user show' do
    visit '/users/:id'
    expect(page).to have_text('This is a single user')
  end
end
