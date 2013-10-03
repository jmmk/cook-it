require 'spec_helper'

describe Pantry do
  it { should belong_to :user }
  it { should have_many(:pantry_ingredients).dependent(:destroy) }
  it { should have_many(:ingredients).through :pantry_ingredients }
end
