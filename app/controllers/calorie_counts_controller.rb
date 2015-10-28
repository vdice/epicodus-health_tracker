class CalorieCountsController < ApplicationController
  def index
    @calories = CalorieCount.all
    @exercises = Exercise.all
    @foods = Food.all
    @food_calories = 0
    @exercise_calories = 0
    CalorieCount.where(countable_type: "Food").map { |c| @food_calories += c.count }
    CalorieCount.where(countable_type: "Exercise").map { |c| @exercise_calories += c.count }
  end
end
