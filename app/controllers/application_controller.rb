class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :get_total, :sort_column, :sort_direction

  def search model, search
    if search
      model.where('lower(name) LIKE ?', "%#{search.downcase}%")
    else
      model
    end
  end

  private
  def get_total type
    total = 0
    CalorieCount.where(countable_type: type).map { |c| total += c.count }
    total
  end

  def sort_column
    %w[name calorie_counts.count].include?(params[:sort]) ? params[:sort] : 'name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
