class GeneralShoppingListsController < ApplicationController
  def index
    @foods = Food.all
  end
end
