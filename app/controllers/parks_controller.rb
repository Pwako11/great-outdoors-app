class ParksController < ApplicationController
#before_action : authentication_required
    def index 
        # raise params.inspect
        @parks = Park.all
    end 

    def show
        @park = Park.find(params[:id])
    end 

    # def new
    #     @park = Park.new
    # end 

    # def create
    #     park = Park.create(park_params)
    #     redirect_to park
    # end 

    # private

    def park_params
        params.require(:park).permit(:name, :state, :description, :id, amenity:[], amenities_attributes: [:name])
    end
end
