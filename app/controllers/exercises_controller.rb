class ExercisesController < ApplicationController
  before_action :find_exercise, except: [:index, :new, :create]
  def new
    @exercise = Exercise.new
    @exercise.calorie_count = CalorieCount.new

    respond_to do |format|
      format.js
    end
  end

  def create
    @paginated_exercises = Exercise.all.order(sort_column + ' ' + sort_direction).paginate(:page => params[:exercises_page], :per_page => 5)
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
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
