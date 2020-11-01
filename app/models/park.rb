class Park < ApplicationRecord
    has_many :reviews 
    has_many :users, through: :reviews  

    scope :most_reviews, -> { joins(:reviews).group(:count).first}
end
