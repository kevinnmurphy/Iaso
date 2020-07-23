class FoodsController < ApplicationController

  before_action :require_login
  before_action :set_foods!, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_owner, only: [:show, :edit, :update]
  

  def new
    @food = Food.new
  end
  
  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to food_path(food)
    else
      # @food = Food.find_by_id(params[:food_id])
      render :new
    end
  end
  
  def index
    @foods = Food.all
  end

  def show
    
  end

  def edit
    
  end

  def update
    
    @food.update(food_params)
    redirect_to food_path(food)
  end

  def destroy
    Food.find(params[:id]).destroy
    redirect_to foods_url
  end

  
  private

  def food_params
    params.require(:food).permit(:name, :category, :carbs, :fats, :proteins, :calories)
  end

  def set_foods!
    @food = Food.find(params[:id])
  end

  def redirect_if_not_owner
    if @food.user != current_user
      redirect_to user_path(current_user), alert: "You do not have permission to edit this"
    end
  end

end