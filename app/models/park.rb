class Park < ApplicationRecord
    has_many :park_amenities
    has_many :amenities, through: :park_amenities
    has_many :reviews
    has_many :users, through: :reviews  
    
    def amenities_attributes=(amenities_attributes)
        amenities_attributes.values.each do |i, amenity_attributes|
            if amenity_attributes[:name].present?
                amenity = Amenity.find_or_create_by(amenity_attributes)
                if !self.amenities.include?(amenity)
                    self.park_amenities.build(:amenity => amenity)
                end 
            end 
        end 
    end 
end
