class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where('public = true').order(id: :desc).includes(:foods).includes(:user)
  end
end
