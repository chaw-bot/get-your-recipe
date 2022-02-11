class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :delete_all
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0 }

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
