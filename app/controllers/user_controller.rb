class FishController < ApplicationController
    #allows multiple POSTs to app
    skip_before_filter :verify_authenticity_token 

    def show
        @user = current_user
        respond_to do |format|
          format.json { render json: @user}
        end
    end

end