class User < ApplicationRecord
    has_many :reviews
    has_many :parks, through: :reviews

    validates :user_name, presence: true
    validates :user_name, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true

    has_secure_password

    def to_s
        self.first_name + " " + self.last_name
    end
end
