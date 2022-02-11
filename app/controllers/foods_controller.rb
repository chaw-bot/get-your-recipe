class FoodsController < ApplicationController
  def index
    @user = User.includes(:foods).find(current_user.id)
    @foods = @user.foods
  end

  def new
    @user = User.includes(:foods).find(current_user.id)
    @food = @user.foods.new
    render :new, locals: { food: @food }
  end

  def create
    add_food = current_user.foods.new(food_params)
    if add_food.save
      redirect_to '/foods', notice: 'Food was successfully added.'
    else
      render :new, alert: 'Failed to add food'
    end
  end

  def destroy
    @food = set_food
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Foods was deleted successfully.' }
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
