class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show; end

  def new; end

  def create
    redirect_to '/foods', notice: 'Success!'
  end

  def destroy; end
end
