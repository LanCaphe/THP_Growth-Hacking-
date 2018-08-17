require 'rails_helper'
require 'capybara/rspec'

feature "Signing in" do
  background do
    User.make(email: 'user@example.com', password: 'caplin')
  end

  scenario "Signing in with correct credentials" do
    visit '/index'
    within("#session") do
      fill_in 'email', with: 'bob@example.com'
      fill_in 'name', with: 'bob'
    end
    click_button 'actions'
    expect(page).to have_content 'Success'
  end
end
