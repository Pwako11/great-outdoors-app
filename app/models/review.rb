class Review < ApplicationRecord
    belongs_to :park
    belongs_to :user
    
    validates :title, {presence: true, length:{maximum:50}}
    validates :content, {presence: true, length:{maximum:300}}
    validates :rating, presence: true
    validates :rating, numericality: true
    
end
