class MealsController < ApplicationController

  before_action :require_login
  before_action :set_meals!, only: [:show, :edit, :update]

  def new
    if params[:food_id] && @food = Food.find_by_id(params[:food_id])
      @meal = @food.meals.build
    else
      @meal = Meal.new
      #  @meal.build_food
    end
  end

  def create
      meal = Meal.new(meal_params)
      if @meal.save
      redirect_to meal_path(meal)
      else
        # @food = Food.find_by_id(params[:food_id])
        render :new
      end
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