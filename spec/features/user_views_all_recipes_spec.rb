require 'spec_helper'

feature 'user views all recipes', %Q{
  As a registered user
  I want to view all my recipes
  So that I can choose one to look at
  } do

# Acceptance Criteria:
#   -If no recipes exist, notify me
#   -Can view titles
#   -Can view limited number of ingredients in preview
#   -Can select a specific recipe
#   -Can scroll if list is long enough

  scenario 'user visits index to see all recipes' do
    FactoryGirl.create(:recipe, title: 'Super Beef')
    FactoryGirl.create(:recipe, title: 'Super Pork')
    FactoryGirl.create(:recipe)

    visit recipes_path
    expect(page).to have_content('Super Beef')
    expect(page).to have_content('Super Chicken')
    expect(page).to have_content('Super Pork')
    expect(page).to have_content('2 Onions')
  end
end