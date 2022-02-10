class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  def list_all_public_recipes
    public_recipes.order('created_at ASC')
  end

  def total_food_items
    foods.size
  end

  def total_price
    foods.sum('price')
  end
end
