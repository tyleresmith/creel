class UsersController < ApplicationController
    #allows multiple POSTs to app
    skip_before_filter :verify_authenticity_token 
    
    def index
        @user = current_user
        respond_to do |format|
          format.json { render json: @user}
        end
    end
    
    def show
        @user = User.find(params[:id])
        respond_to do |format|
          format.json { render json: @user}
        end
    end

end