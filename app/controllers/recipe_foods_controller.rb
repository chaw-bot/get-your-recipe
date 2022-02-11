class RecipeFoodsController < ApplicationController
  def show; end

  def create
    @recipe = Recipe.find(params[:id])
    # @recipe = Recipe.where(id: :id)
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)
    @recipe_food.user = current_user
    @recipe_food.save!
    # @recipe = current_user.recipes.find(params[:id])
    # @recipe_foods = @recipe.recipe_foods.new(recipe_foods_params)
    # redirect_to recipe_path(@recipe.id), notice: 'Ingredient saved successfully'
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
