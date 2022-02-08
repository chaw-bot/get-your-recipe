class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.all
    # @users = User.all.order(created_at: :desc)
  end
end
