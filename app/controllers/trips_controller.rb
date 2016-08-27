class TripsController < ApplicationController
    #allows multiple POSTs to app
    skip_before_filter :verify_authenticity_token 
    before_action :set_trip!, only: [:show, :update, :destroy]
    
    def index
        @trips = current_user.trips
        respond_to do |format|
          format.json { render json: @trips}
        end
    end
    
    def show
        respond_to do |format|
          format.json { render json: @trip}
        end
    end
    
    def create
        @trip = Trip.new(trip_params)
        @trip.user = current_user
        @trip.save
        head :no_content
    end
    
    def update 
        @trip.update_attributes(trip_params)
        head :no_content
    end
    
    def destroy
        @trip.destroy
        head :no_content
    end
    
    private
    
    def set_trip!
        @trip = Trip.find(params[:id])
    end
    
    def trip_params
        params.require(:trip).permit(:location, :city, :state, :water_type, :body_type)
    end

end