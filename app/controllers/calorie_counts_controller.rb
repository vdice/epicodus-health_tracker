class CalorieCountsController < ApplicationController
  def index
    @calories = CalorieCount.all
    @exercises = Exercise.all
    @foods = Food.all
  end
end
