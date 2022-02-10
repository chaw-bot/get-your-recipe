class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where('public = true').order(id: :desc).includes(:foods).includes(:user)
    # @public_recipes = Recipe.all

    # @user_recipe = User.recipe
    # foods_recipe = @user.foods

    # @foods = current_user.foods
    # @total_food_items = @foods.size
    # @total_price = @foods.sum('price')

    # # @shopping = current_user.recipes.includes(:recipe_foods)
    # @recipe = current_user.recipes.find(params[:recipe_id])
  end
end
