class RecipeFoodsController < ApplicationController
  def show; end

  def create
    @recipe = current_user.recipes.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.new(recipe_foods_params)
    redirect_to recipe_path(@recipe.id), notice: 'Ingredient saved successfully'
  end

  def new
    # @user = User.find(params[:user_id])
    # @food = @user.foods.new
  end

  private

  def recipe_food_params
    params.require(:recipe_foods).permit(:quantity, :recipe_id)
  end
end
