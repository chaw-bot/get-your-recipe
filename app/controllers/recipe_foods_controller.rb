class RecipeFoodsController < ApplicationController
  def show; end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    # @recipe = Recipe.where(id: :id)
    @food = Food.new(food_params)
    @food.user = current_user
    @food.save!
    @recipe_food = @recipe.recipe_foods.new(food: @food, quantity: params[:food][:quantity])
    @recipe_food.save!
    # redirect_to general_shopping_lists_path
    redirect_to recipe_path(@recipe), notice: 'Ingredient saved successfully'
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    # @user = User.find(params[:user_id])
    # @food = @user.foods.new
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end