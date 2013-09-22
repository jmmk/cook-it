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

  # As a user
  # I want to edit recipes
  # So that I can change or improve them

  # Acceptance Criteria:
  #   -I can only change my own recipes
  #   -Cannot make recipe invalid

  scenario 'user edits a specific recipe' do
    recipe = FactoryGirl.create(:recipe)
    visit recipe_path(recipe)
    click_on 'Edit Recipe'
    expect(page).to have_content('Edit Recipe')
    fill_in 'Title', with: 'BAM Chicken'
    fill_in 'recipe_ingredients_attributes_0_name', with: '1 AWESOME Chicken'
    click_on 'Save Recipe'
    expect(page).to have_content('BAM Chicken')
    expect(page).to have_content('1 AWESOME Chicken')
  end

  # As a user
  # I want to delete a recipe
  # So that it doesn't show up in my collection

  # Acceptance Criteria:
  #   -Ask for confirmation
  #   -Can only delete my recipes

  scenario 'user deletes recipe' do
    recipe = FactoryGirl.create(:recipe)
    visit recipe_path(recipe)
    click_on 'Delete Recipe'
    expect(page).to_not have_content('Super Chicken')
    expect(page).to have_content('Recipe Deleted Successfully')
  end
end