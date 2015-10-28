class ExercisesController < ApplicationController
  before_action :find_exercise, except: [:index, :new, :create]
  def new
    @exercise = Exercise.new
    @exercise.calorie_count = CalorieCount.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to root_path
  end
private

  def exercise_params
    params.require(:exercise).permit(:name, calorie_count_attributes: [:count] )
  end

  def find_exercise
    @exercise = Exercise.find(params[:id])
  end
end
