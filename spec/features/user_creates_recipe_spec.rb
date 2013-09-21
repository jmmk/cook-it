require 'spec_helper'

feature 'user creates a recipe', %Q{
  As a registered user
  I want to create a new recipe
  So that I can flesh it out with ingredients
} do

# Acceptance Criteria:
#   -Must have title
#   -Must have at least one ingredient

  scenario 'user enters valid information' do
    visit new_recipe_path
    expect(page).to have_content('Create New Recipe')
    fill_in 'Title', with: 'Super Chicken'
    fill_in 'recipe_ingredients_attributes_0_name', with: '1 Chicken'
    fill_in 'recipe_ingredients_attributes_1_name', with: '2 Onions'
    fill_in 'recipe_ingredients_attributes_2_name', with: '3 Peppers'
    click_on 'Create Recipe'

    expect(page).to have_content('Super Chicken')
    expect(page).to have_content('1 Chicken')
    expect(page).to have_content('2 Onions')
    expect(page).to have_content('3 Peppers')
  end
end