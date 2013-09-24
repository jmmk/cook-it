class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    3.times { @recipe.ingredients.build }
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe Saved'
    else
      render new_recipe_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render edit_recipe_path
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe Deleted'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :directions, ingredients_attributes: [:id, :name])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end