class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
    # @recipe = @recipes.find(params[:id])
    # @user = User.find(params[:id])
    # @recipe = @user.recipes.find(params[:id])
  end

  def new; end

  def create
    redirect_to '/foods', notice: 'Success!'
  end

  def destroy; end
end
