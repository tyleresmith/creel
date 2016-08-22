
class FishController < ApplicationController
    #allows multiple POSTs to app
    skip_before_filter :verify_authenticity_token 
    # prepend_view_path 'app/assets/javascipt/templates'
    before_action :set_fish!, only: [:show, :update, :destroy]
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
        @fish.update_attributes(fish_params)
        head :no_content
    end
    
    def destroy
        @fish.destroy
        head :no_content
    end
    
    private
    
    def set_fish!
        @fish = Fish.find(params[:id])
    end
    
    def fish_params
        params.require(:fish).permit(:common_name,:species_name)
    end
end