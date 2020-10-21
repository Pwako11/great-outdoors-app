class User < ApplicationRecord
    has_many :reviews
    has_many :parks, through: :reviews

    validates :user_name, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true

    has_secure_password

end
