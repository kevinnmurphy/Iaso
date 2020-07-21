class MealsController < ApplicationController

    before_action :require_login
    before_action :set_meals!, only: [:show, :edit, :update]

    def new
      @meal = Meal.new
  end

  def create
      meal = Meal.create(meal_params)
      redirect_to meal_path(meal)
  end

  def index
      @meals = Meal.all
  end

  def show

      # @food = @meal.foods.build(user_id: current_user.id)
  end

  def edit

  end

  def update
      @meal.update(meal_params)
      redirect_to meal_path(meal)
  end

    
    private

    def meal_params
        params.require(:meals).permit(:category, :calorie_count)
    end

    def set_meals!
        @meal = Meal.find(params[:id])
    end
end