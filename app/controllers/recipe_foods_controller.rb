class RecipeFoodsController < ApplicationController
  def create
    # @user = User.find(params[:user_id])
    # @food = @user.foods.create(post_params)
    # @post.save
    # redirect_to user_posts_path(@user)
    redirect_to '/foods', notice: 'Success!'
  end

  def new
    # @user = User.find(params[:user_id])
    # @food = @user.foods.new
  end

  # def post_params
  #   params.require(:post).permit(:name, :quantity, :price)
  # end
end
