class TripsController < ApplicationController
    #allows multiple POSTs to app
    skip_before_filter :verify_authenticity_token 
    
    def index
        @trips = current_user.trips
        respond_to do |format|
          format.json { render json: @trips}
        end
    end
    
    def show
        @trip = Trip.find(params[:id])
        respond_to do |format|
          format.json { render json: @trip}
        end
    end

end