class Park < ApplicationRecord
    has_many :reviews 
    has_many :users, through: :reviews  

    scope :most_reviews, -> { joins(:reviews).group(:count).first}
    scope :highest_rating, -> { joins(:reviews).where(reviews: {rating: 5}).first}
end
