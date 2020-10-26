class ParkAmenity < ApplicationRecord
    belongs_to :park 
    belongs_to :amenity 
    belongs_to :review
end
