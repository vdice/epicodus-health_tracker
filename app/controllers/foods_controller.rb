class FoodsController < ApplicationController
  before_action :find_food, except: [:index, :new, :create]
  def new
    @food = Food.new
    @food.calorie_count = CalorieCount.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to food_path(@food)
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to root_path
  end

private

  def food_params
    params.require(:food).permit(:name, calorie_count_attributes: [:count] )
  end

  def find_food
    @food = Food.find(params[:id])
  end
end
