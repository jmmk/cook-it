require 'spec_helper'

describe PantryIngredient do
  it { should belong_to :pantry }
  it { should belong_to :ingredient }
end
