class User < ApplicationRecord
    has_many :reviews
    has_many :parks, through: :reviews
    
    validates :email, uniqueness: true

    has_secure_password
    
end
