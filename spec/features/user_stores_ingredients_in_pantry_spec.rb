require 'spec_helper'

feature 'user stores ingredients in pantry', %Q{
As a registered user
I want to add an ingredient to my pantry
So that I can keep track of items I already have available
} do

# Acceptance Criteria:
# -I can add one or more items
# -I can see a list of all previously stored items

  scenario 'User saves ingredients' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit pantry_path
    previous_count = PantryIngredient.count

    fill_in 'New Ingredient', with: 'Eggs'
    click_on 'Add Ingredient'
    fill_in 'New Ingredient', with: 'Chicken'
    click_on 'Add Ingredient'
    expect(page).to have_content('Chicken')
    expect(page).to have_content('Eggs')
    expect(PantryInredient.count).to eql(previous_count + 2)
  end
end