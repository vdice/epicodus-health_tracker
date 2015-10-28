class CalorieCountsController < ApplicationController
  helper_method :get_total

  def index
    @calories = CalorieCount.all
    @exercises = Exercise.all
    @foods = Food.all
  end

  def get_total type
    total = 0
    CalorieCount.where(countable_type: type).map { |c| total += c.count }
    total
  end
end
