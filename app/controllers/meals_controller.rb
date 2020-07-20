class MealsController < ApplicationController

    before_action :require_login
    before_action :set_logs!, only: [:show, :edit, :update]

    def index

    end

    def show

    end
  
    def edit
        
    end
  
    def update
      if @post.update(post_params)
        redirect_to post_path(@post)
      else
        render :edit
      end
    end

    
    private

    def logs_params
        params.require(:logs).permit(:date, :calorie_count)
    end

    def set_logs!
        @post = Post.find(params[:id])
    end
end