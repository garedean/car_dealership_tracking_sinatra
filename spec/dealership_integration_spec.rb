require('capybara/rspec')
require('./app')
require('pry')
Capybara.app = Sinatra::Application

describe("the Dealership Central app", :type => :feature) do
  before do
    visit('/')
    click_link('Reset everything!')
  end
  describe("/dealerships/new path", :type => :feature) do
    it('loads the page to add a new dealership') do
      visit('/')
      click_link('Add New Dealership')
      expect(page).to(have_content("Add a New Dealership"))
    end
  end

  describe("/dealerships/:id path", :type => :feature) do
    it('loads the page for a specific dealership') do
      visit('/dealerships/new')
      fill_in('name', :with => "Bob's Cars")
      click_button('Submit')
      click_link("Bob's Cars")
      expect(page).to(have_content("Bob's Cars"))
    end
  end

  describe("/vehicles/:id path", :type => :feature) do
    it('loads the page for a specific vehicle') do
      visit('/dealerships/new')
      fill_in('name', :with => "Bob's Cars")
      click_button('Submit')
      click_link("Bob's Cars")
      click_link("Add a new vehicle")
      fill_in('make', :with => 'Honda')
      fill_in('model', :with => 'Civic')
      fill_in('year', :with => '2005')
      click_button("Submit!")
      click_link("Back")
      click_link("Honda Civic 2005")
      expect(page).to(have_content("Make: Honda"))
      expect(page).to(have_content("Model: Civic"))
      expect(page).to(have_content("Year: 2005"))
    end
  end
end
