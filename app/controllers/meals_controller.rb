class MealsController < ApplicationController

  before_action :require_login
  before_action :find_meals, only: [:show, :edit, :update]
  # before_action :redirect_if_not_owner,  only: [:show, :edit, :update, :destroy]


  def new
    if params[:food_id] && @food = Food.find_by_id(params[:food_id])
      @meal = @food.meals.build
    else
      @meal = Meal.new
    end
  end

  def create
    meal = current_user.meals.build(meal_params)
    if meal.save
      redirect_to meal_path(meal)
    else
      render :new
    end
  end

  def index
    #nested route
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @meals = @user.meals
    else
        @meals = Meal.all 
    end
  end

  def show
    @foods = Food.all
    @food = @meal.foods.build
    @foodlogs = @meal.foodlogs
    if @meal = current_user.meals.find_by_id(params[:id])
      @foodlog = @meal.foodlogs.build#(meal_params)
    else
      @meal = Meal.find_by_id(params[:id])
    end
  end

  def edit
    @meal = current_user.meals.find_by_id(params[:id])
    # @foodlogs = current_user.foodlogs.find_by_id(params[:id])
    # @foods = Food.all
  end

  def update
    if meal = current_user.meals.find_by_id(params[:id])
    meal.update(meal_params)

    # meal = @food.meals.update(meal_params)
    
    redirect_to meal_path(meal)
    # @meal.foodlogs << foodlog
    else
      render :new
    end
  end

  def destroy
    meal = current_user.meals.find_by_id(params[:id])
    meal.destroy
    redirect_to meals_path
  end

    
  private

  def meal_params
    params.require(:meal).permit(:name, food_attributes: [:name, :category, :carbs, :fats, :proteins, :calories], foodlog_attributes: [:quantity, :meal_id, :food_id])
  end

  def find_meals
    @meal = Meal.find(params[:id])
  end

  def redirect_if_not_owner
      if @meal.user != current_user
          redirect_to user_path(current_user), alert: "You can't edit this meal!"
      end
  end

end
