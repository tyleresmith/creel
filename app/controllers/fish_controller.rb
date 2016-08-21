class FishController < ApplicationController
    def index
        @fish = if params[:keywords]
                     Fish.where('common_name LIKE ? OR species_name LIKE ?',"%#{params[:keywords]}%","%#{params[:keywords]}%")
                   else
                     []
                   end
        
        # @fish = Fish.all
        respond_to do |format|
          format.json { render json: @fish}
        end
    end
    
    def show
        
    end
end
