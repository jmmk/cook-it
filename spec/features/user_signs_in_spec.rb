require 'spec_helper'

feature 'user signs in', %Q{
As a registered user
I want to sign in
so that I can access the website
} do

# Acceptance Criteria:
# *I must enter my email and password
# *If I enter the information correctly, I am authenticated and logged in
# *If I enter incorrect information, I am presented with errors

  scenario 'user signs in with correct information' do

    User.create(password:'rteidowa', email: 'example@example.com', password_confirmation: 'rteidowa')
    visit new_user_session_path
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password', with: 'rteidowa'
    click_button 'Sign In'
    expect(page).to have_content('Signed in successfully.')

  end
end