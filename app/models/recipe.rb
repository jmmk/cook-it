class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients, inverse_of: :recipe, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredients, reject_if: lambda { |i| i[:name].blank? }

  validates_presence_of :title
end
