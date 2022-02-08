class PublicRecipesController < ApplicationController
  load_and_authorize_resource
  def index
    @public_recipes = Recipe.all
    # @users = User.all.order(created_at: :desc)
  end
end
