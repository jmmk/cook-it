require 'spec_helper'

feature 'user selects a recipe', %Q{
As a registered user
I want to view a stored recipe
So that I can do something with it
} do

# Acceptance Criteria:
#   -Can view title
#   -Can view whole list of ingredients
#   -Can perform actions with recipe
#   -Can see an edit option

  scenario 'user visits index and selects a recipe' do
    FactoryGirl.create(:recipe)

    visit recipes_path
    click_on 'Super Chicken'
    expect(page).to have_content('Super Chicken')
    expect(page).to have_content('1 Chicken')
    expect(page).to have_content('2 Onions')
    expect(page).to have_content('3 Peppers')
  end
end