class CalorieCountsController < ApplicationController
  def index
    @calories = CalorieCount.all

    if params[:sort] && params[:sort].include?('calorie_count')
      @exercises = Exercise.includes(:calorie_count)
      @foods = Food.includes(:calorie_count)
    else
      @exercises = Exercise.all
      @foods = Food.all
    end

    # TODO: paginate in food/exercise or application controller
    @exercises = @exercises.order(sort_column + ' ' + sort_direction).paginate(:page => params[:exercises_page], :per_page => 5)
    @foods = @foods.order(sort_column + ' ' + sort_direction).paginate(:page => params[:foods_page], :per_page => 5)
  end
end
