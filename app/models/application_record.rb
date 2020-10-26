class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

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
