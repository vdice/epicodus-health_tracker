class CalorieCountsController < ApplicationController
  def index
    @calories = CalorieCount.all
    @exercises = Exercise.all
    @foods = Food.all

    @exercises = search(Exercise, params[:search])
    @foods = search(Food, params[:search])

    if params[:sort] && params[:sort].include?('calorie_count')
      @exercises = @exercises.includes(:calorie_count)
      @foods = @foods.includes(:calorie_count)
    end

    if params[:class_name] && params[:class_name] == "exercise"
      @sorted = @exercises = @exercises.order(sort_column + ' ' + sort_direction)
    else
      @sorted = @foods = @foods.order(sort_column + ' ' + sort_direction)
    end

    @exercises = @exercises.paginate(:page => params[:exercises_page], :per_page => 5)
    @foods = @foods.paginate(:page => params[:foods_page], :per_page => 5)
    @sorted = @sorted.paginate(:page => params[:foods_page], :per_page => 5)

    respond_to do |format|
      format.html #{ redirect_to root_path }
      format.js
    end
  end
end
