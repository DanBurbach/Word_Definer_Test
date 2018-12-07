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

describe('got to word and look at definition', {:type => :feature}) do
  it "goes to a word" do
    visit('/')
    fill_in('word', :with => 'dog')
    fill_in('definition', :with => 'canine')
    visit('/word/1')
    expect(page).to have_content('dog')
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
