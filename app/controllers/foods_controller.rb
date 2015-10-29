class FoodsController < ApplicationController
  before_action :find_food, except: [:index, :new, :create]
  def new
    @food = Food.new
    @food.calorie_count = CalorieCount.new

    respond_to do |format|
      #format.html { redirect_to root_path }
      format.js
    end
  end

  def create
    @paginated_foods = Food.all.order(sort_column + ' ' + sort_direction).paginate(:page => params[:foods_page], :per_page => 5)
    @food = Food.new(food_params)
    if @food.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
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
