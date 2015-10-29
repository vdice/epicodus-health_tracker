class CalorieCountsController < ApplicationController
  def index
    @calories = CalorieCount.all
    @exercises = Exercise.all
    @foods = Food.all

    if params[:sort] && params[:sort].include?('calorie_count')
      @exercises = Exercise.includes(:calorie_count)
      @foods = Food.includes(:calorie_count)
    end

    if params[:class_name] && params[:class_name] == "exercise"
      @exercises = @exercises.order(sort_column + ' ' + sort_direction)
    else
      @foods = @foods.order(sort_column + ' ' + sort_direction)
    end

    @exercises = @exercises.paginate(:page => params[:exercises_page], :per_page => 5)
    @foods = @foods.paginate(:page => params[:foods_page], :per_page => 5)
  end
end
