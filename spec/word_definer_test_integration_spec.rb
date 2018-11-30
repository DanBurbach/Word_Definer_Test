require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Favorite-Things', {:type => :feature}) do
  it('Takes a name and definition from the user, and adds it to an ordered list') do
    visit('/')
    fill_in('word', :with => 'apple')
    fill_in('definition', :with => 'a fruit')
    click_button('Add!')
    fill_in('word', :with => 'clock')
    fill_in('definition', :with => 'a mechanical or electrical device for measuring time')
    click_button('Add!')
    expect(page).to have_content("clock a mechanical or electrical device for measuring time apple a fruit")
  end
end
