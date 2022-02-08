class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    # @recipe = @recipes.find(params[:id])
    @user = User.find(params[:id])
    @recipe = @user.recipes.find(params[:id])
  end

  def new; end

  def create; end

  def destroy; end
end
