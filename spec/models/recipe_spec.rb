require 'spec_helper'

describe Recipe do

  it { should have_many(:recipe_ingredients).dependent(:destroy) }
  it { should have_many :ingredients }

  it { should have_valid(:title).when('Super Chicken') }
  it { should_not have_valid(:title).when('', nil) }

end
