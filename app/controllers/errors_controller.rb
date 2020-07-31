class ErrorsController < ApplicationController

  # rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    redirect_to root_path, alert: "Resource doesn't exist"
  end


  # def not_found
  #   respond_to do |format|
  #     format.html { render status: 404 }
  # end

  # rescue ActionController::UnknownFormat
  #   render status: 404, text: "nope"
  # end
  
end