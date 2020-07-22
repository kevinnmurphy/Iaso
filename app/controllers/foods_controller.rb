class FoodsController < ApplicationController

    before_action :require_login

    def new
        @food = Food.new
      end
    
      def create
        food = Food.new(food_params)
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
        @food = Food.find(params[:id])
      end
    
      def edit
        @food = Food.find(params[:id])
      end
    
      def update
        @food = Food.find(params[:id])
        @food.update(food_params)
        redirect_to food_path(food)
      end

      def destroy
        Food.find(params[:id]).destroy
        redirect_to foods_url
      end

    
    private

    def foods_params
        params.require(:foods).permit(:name, :calories, :weight)
    end
end