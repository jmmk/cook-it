class PantriesController < ApplicationController

  def show
    @pantry = Pantry.find_by(user_id: current_user.id)
    @pantry_ingredients = PantryIngredient.where(pantry_id: @pantry)
    @pantry.ingredients.build
  end

  def update
    @pantry = Pantry.find(params[:pantry][:id])

    if @pantry.update(pantry_params)
      redirect_to @pantry
    else
      redirect_to :back
    end
  end

  protected

  def pantry_params
    params.require(:pantry).permit(:id, ingredients_attributes: [:id, :name])
  end

end