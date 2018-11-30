require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Favorite-Things', {:type => :feature}) do
  it('Takes a name and definition from the user, and adds it to an ordered list') do
    visit('/')
    fill_in('word', :with => 'apple')
    fill_in('definition', :with => 'the round fruit of a tree of the rose family, which typically has thin red or green skin and crisp flesh. Many varieties have been developed as dessert or cooking fruit or for making cider.')
    click_button('Add!')
    fill_in('name', :with => 'clock')
    fill_in('rank', :with => 'a mechanical or electrical device for measuring time, indicating hours, minutes, and sometimes seconds, typically by hands on a round dial or by displayed figures.')
    click_button('Go!')
    expect(page).to have_content("clock a mechanical or electrical device for measuring time, indicating hours, minutes, and sometimes seconds, typically by hands on a round dial or by displayed figures. apple the round fruit of a tree of the rose family, which typically has thin red or green skin and crisp flesh. Many varieties have been developed as dessert or cooking fruit or for making cider.")
  end
end
