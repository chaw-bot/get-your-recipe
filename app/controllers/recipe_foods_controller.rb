class RecipeFoodsController < ApplicationController
  # def show; end

  # def create
  #   # @recipe = Recipe.find(params[:id])
  #   @recipe = Recipe.where(id: :id)
  #   @recipe_food = @recipe.recipe_foods.new(recipe_food_params)
  #   @recipe_food.user = current_user
  #   # @recipe = current_user.recipes.find(params[:id])
  #   # @recipe_foods = @recipe.recipe_foods.new(recipe_foods_params)
  #   # redirect_to recipe_path(@recipe.id), notice: 'Ingredient saved successfully'
  # end

  # def new
  #   # @user = User.find(params[:user_id])
  #   # @food = @user.foods.new
  # end

  # private
  

  # def recipe_food_params
  #   params.require(:recipe_foods).permit(:quantity, :recipe_id)
  # end
  
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html do
          redirect_to recipe_path(recipe_food_params[:recipe_id]), notice: 'Recipe food was successfully created.'
        end
      else
        set_foods
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_foods
    @foods = current_user.foods.map { |food| [food.name, food.id] }
  end

  def set_recipe_food
    @recipe_food = RecipeFood.includes(:recipe, :food).find(params[:id])
  end

  def recipe_food_params
    params.fetch(:recipe_food, {}).permit(:quantity, :food_id, :recipe_id)
  end

end
