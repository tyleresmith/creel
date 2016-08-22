
class FishController < ApplicationController
    #allows multiple POSTs to app
    skip_before_filter :verify_authenticity_token 
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
        @fish = Fish.find(params[:id])
        respond_to do |format|
          format.json { render json: @fish}
        end
    end
    
    def create
        @fish = Fish.new(fish_params)
        @fish.save
        render 'show', status: 201
    end
    
    def update 
        fish = Recipe.find(params[:id])
        fish.update_attributes(fish_params)
        head :no_content
    end
    
    private
    
    def fish_params
        params.require(:fish).permit(:common_name,:species_name)
    end
end