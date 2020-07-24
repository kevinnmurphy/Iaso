class MealsController < ApplicationController

  before_action :require_login
  before_action :set_meals!, only: [:show, :edit, :update]
  # before_action :redirect_if_not_owner, only: [:edit, :update]#, :destroy]


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
    meal = current_user.meals.build(meal_params)
    if meal.save
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
    if @meal = current_user.meals.find_by_id(params[:id])
      @food = @meal.foods.build(user_id: current_user.id)
    else
      @meal = Meal.find_by_id(params[:id])
    end
  end

  def edit
    @meal = current_user.meals.find_by_id(params[:id])

    @foodlogs = current_user.foodlogs.find_by_id(params[:id])
    @foods = Food.all
  end

  def update
    meal = current_user.meals.find(params[:id])
    meal.update(meal_params)
    redirect_to meal_path(meal)
  end

  def destroy
    meal = current_user.meals.find_by_id(params[:id])
    meal.destroy
    redirect_to meals_path
  end

    
  private

  def meal_params
    # params.require(:meal).permit(:name)
    params.require(:meal).permit(:name, foods_attributes: [:name, :category, :carbs, :fats, :proteins, :calories])
  end

  def set_meals!
    @meal = Meal.find(params[:id])
  end
end