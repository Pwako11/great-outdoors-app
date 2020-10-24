class ParksController < ApplicationController
#before_action : authentication_required
    def index 
        @parks = Park.all
    end 

    def show
        #raise params.inspect
        @park = Park.find(params[:id])
    end 
end
