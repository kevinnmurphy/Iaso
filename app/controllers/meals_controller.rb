class MealsController < ApplicationController

  before_action :require_login
  before_action :set_meals!, only: [:show, :edit, :update]

  def new
    if params[:food_id] && @food = Food.find_by_id(params[:food_id])
      @meal = @food.meals.build
    else
      @meal = Meal.new
      # @meal.foods.create(meal_params)
    end
  end

  def create
    # @food = Food.new(food_params) #finish this nest
    @meal = current_user.meals.build(meal_params)
    if @meal.save
      redirect_to meal_path(meal)
    else
      @food = Food.find_by_id(params[:food_id])
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

  def destroy
    Meal.find(params[:id]).destroy
    redirect_to user_meals_url
  end

    
  private

  def meal_params
    params.require(:meal).permit(:name)
  end

  def set_meals!
    @meal = Meal.find(params[:id])
  end
end