require 'spec_helper'

describe Ingredient do

  it { should have_many :recipe_ingredients }
  it { should have_many :recipes}

  it { should have_valid(:name).when('Chicken') }
  it { should_not have_valid(:name).when('', nil) }
end
