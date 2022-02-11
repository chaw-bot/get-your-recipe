class RecipeFoodsController < ApplicationController
  def show; end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)
    if @recipe_food.save
      redirect_to recipe_path(@recipe.id), notice: 'Ingredient was successfully added.'
    else
      render :new, alert: 'Failed to add Recipefood'
    end
  end

  def new
    @foods = current_user.foods
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.destroy
      redirect_to recipe_path(params[:recipe_id]), notice: 'Successfully deleted!'
    else
      redirect_to recipe_path(params[:recipe_id]), alert: 'Error occured!'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_foods).permit(:quantity, :food_id)
  end
end
