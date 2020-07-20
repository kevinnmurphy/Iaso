class FoodsController < ApplicationController

    def index

    end

    
    private

    def foods_params
        params.require(:foods).permit(:name, :calories, :weight)
    end
end