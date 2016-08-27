class CatchesController < ApplicationController
    #allows multiple POSTs to app
    skip_before_filter :verify_authenticity_token 
    
    def index
        @catches = current_user.catches
        
        respond_to do |format|
          format.json { render json: @catches}
        end
    end
    
    def show
        @catch = catch.find(params[:id])
        respond_to do |format|
          format.json { render json: @catch}
        end
    end

end