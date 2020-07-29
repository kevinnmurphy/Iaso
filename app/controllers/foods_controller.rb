class FoodsController < ApplicationController

  before_action :require_login
  before_action :find_foods, only: [:edit, :update, :destroy]
  # before_action :redirect_if_not_owner, only: [:edit, :update, :destroy]
  

  def new
    if params[:meal_id] && @meal = Meal.find_by_id(params[:meal_id])
        @food = @meal.foods.build
        @foodlog = @food.foodlogs.build
    else
        @food = Food.new
    end
  end

  def create
    # byebug
    @meal = Meal.find_by_id(params[:meal_id])
    food = current_user.foods.build(food_params)

    if food.save
      # redirect_to meal_foods_path(@meal)
      redirect_to meal_path(@meal)
    else
      # @food = Food.find_by_id(params[:food_id])
      render :new
    end
  end
  
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = current_user.foods.find_by_id(params[:id])
  end

  def update
    food = current_user.foods.find(params[:id])
    food.update(food_params)
    redirect_to food_path(food)
  end

  def destroy
    food = current_user.foods.find_by_id(params[:id])
    food.destroy
    redirect_to foods_path
  end

  
  private

  def food_params
    params.require(:food).permit(
      :name, :category, :carbs, :fats, :proteins, :calories, 
      foodlogs_attributes: [:quantity, :meal_id, :food_id])
  end

  def find_foods
    @food = current_user.foods.find_by_id(params[:id])
  end

  def redirect_if_not_owner
    if @food.user != current_user
      redirect_to user_path(current_user), alert: "You do not have permission to edit this"
    end
  end

end