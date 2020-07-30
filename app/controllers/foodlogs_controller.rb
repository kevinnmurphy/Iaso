class FoodlogsController < ApplicationController

    # before_action :require_login
    # before_action :find_foodlogs, only: [:update, :destroy]
    # before_action :redirect_if_not_owner, only: [:edit, :update, :destroy]

    def new
            @foodlogs = Foodlog.new
    end
    
    def create
        meal = Meal.find_by_id(params[:meal_id])
        
        @foodlog = current_user.foodlogs.build(foodlog_params)
        if @foodlog.save
            redirect_to "/meals/#{@foodlog.meal_id}"
        else
            render "/meals/show", alert: "Foodlog must contain quantity"
        end
    end
    
    def index
        @foodlogs = Foodlog.all
    end

    def show
        @foodlog = Foodlog.find(params[:id])
    end

    def edit
        if params[:meal_id] && @meal = Meal.find_by_id(params[:meal_id])
            @foods = Food.all.order_by_name
            @foodlog = @meal.foodlogs.find_by_id(params[:id])
          else
            @foodlog = current_user.foodlogs.find_by_id(params[:id])
          end   
    end

    def update
        foodlog = current_user.foodlogs.find(params[:id])
        foodlog.update(foodlog_params)
        
        redirect_to "/meals/#{foodlog.meal_id}"
    end

    def destroy
        foodlog = current_user.foodlogs.find_by_id(params[:id])
        foodlog.destroy
        redirect_to "/meals/#{foodlog.meal_id}"
    end

    private

    def foodlog_params
        params.require(:foodlog).permit(:quantity, :meal_id, :food_id)
    end

    def find_foodlogs
        @foodlog = current_user.foodlogs.find_by_id(params[:id])
    end
    
    def redirect_if_not_owner
        if @foodlog.user != current_user
            redirect_to user_path(current_user), alert: "You do not have permission to edit this"
        end
    end
end