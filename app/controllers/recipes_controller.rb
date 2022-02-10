class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    # @foods = Food.all
    @foods = current_user.foods
    # @foods_sum = @foods.sum('price')
  end

  def new; end

  def create
    # redirect_to '/foods', notice: 'Success!'
  end

  def destroy; end
end
