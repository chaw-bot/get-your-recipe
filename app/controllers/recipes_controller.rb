class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipes = set_recipe
    @foods = current_user.foods
    @recipe_foods = @recipes.recipe_foods
  end

  def new; end

  def create
    add_recipe = current_user.recipes.new(recipe_params)
    if add_recipe.save
      redirect_to '/recipes', notice: 'Recipe was successfully added.'
    else
      render :new, alert: 'Failed to add recipe'
    end
  end

  def destroy
    @recipe = set_recipe
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipes was deleted successfully.' }
    end
  end

  private

  def set_recipe
    # @recipe = Recipe.find(params[:id])
    @recipe = current_user.recipes.includes(:recipe_foods).find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
