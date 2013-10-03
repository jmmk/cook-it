require 'spec_helper'

feature 'user signs up', %Q{
As a new user
I want to sign up
So that I can rate anything
} do

# Acceptance Criteria
# * There is field for me to enter my name, email, and password
# * If I enter correct information, I am signed up and logged in
# * If I enter incorrect information, I am presented with errors

  scenario 'user enters correct information' do
    visit new_user_registration_path
    fill_in 'Email', with: 'bobdylanxx@music.com'
    fill_in 'user_password', with: 'soldmysoul'
    fill_in 'user_password_confirmation', with: 'soldmysoul'
    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end