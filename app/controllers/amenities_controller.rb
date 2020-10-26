class AmenitiesController < ApplicationController
    def show
        @amenity = Amenity.find(params[:id])
    end
end
