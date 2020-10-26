class Amenity < ApplicationRecord
    has_many :park_amenities
    has_many :parks, through: :park_amenities
    has_many :reviews, through: :park_amenities
end
