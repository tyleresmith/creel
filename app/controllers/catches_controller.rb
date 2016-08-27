class CatchesController < ApplicationController
    #allows multiple POSTs to app
    skip_before_filter :verify_authenticity_token 
    before_action :set_catch!, only: [:show, :update, :destroy]
    
    def index
        @catches = current_user.catches
        respond_to do |format|
          format.json { render json: @catches}
        end
    end
    
    def show
        respond_to do |format|
          format.json { render json: @catch}
        end
    end
    
    def create
        binding.pry
        @catch = Catch.new(catch_params)
        @catch.trip = Trip.find(params[:trip_id])
        @catch.save
        render 'show', status: 201
    end
    
    def update 
        @catch.update_attributes(catch_params)
        head :no_content
    end
    
    def destroy
        @catch.destroy
        head :no_content
    end
    
    private
    
    def set_catch!
        @catch = Catch.find(params[:id])
    end
    
    def catch_params
        params.require(:catch).permit(:fish_id,:location, :weight, :length, :tackle)
    end

end