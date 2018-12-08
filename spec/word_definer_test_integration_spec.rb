require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('enter a word', {:type => :feature}) do
  it "enters a word" do
    visit('/')
    fill_in('word', :with => 'cat')
    fill_in('definition', :with => 'feline')
    click_button("Add!")
    expect(page).to have_content('cat')
  end
end

describe('the word definer', {:type => :feature}) do
  context('when a word is clicked') do
    it('takes you to word.erb, with the definitions displayed') do
      visit('/')
      fill_in('word', :with => 'test')
      fill_in('definition', :with => 'test2')
      click_button('submit!')
      click_link('test')
      expect(page).to have_content("test2")
    end
  end
end

describe('add another definition to a word that is clicked on', {:type => :feature}) do
  it "goes to a word and adds another definition" do
    visit('/')
    fill_in('word', :with => 'boat')
    fill_in('definition', :with => 'a small ship')
    visit('/word/1')
    fill_in('definition', :with => 'a yacht')
    click_button("Add definition")
    visit('/word/1')
    expect(page).to have_content('a yacht')
  end
end
