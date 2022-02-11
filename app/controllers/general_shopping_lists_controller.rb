class GeneralShoppingListsController < ApplicationController
  def index
    @foods = current_user.foods
  end
end
