class FishController < ApplicationController
    def index
        @fish = Fish.all
        respond_to do |format|
          format.json { render json: @fish}
        end
    end
    
    def show
        
    end
end
