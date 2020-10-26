class Review < ApplicationRecord
    belongs_to :park
    belongs_to :user
    has_many :amenities 
    

    def user_attributes(user_attributes)
        user_attributes.values.each do |user_attributes|
            if user_attributes[:user_name].present?
                user = User.find_or_create_by(user_attributes)
                if !self.user = user
                    self.build_user(:user_name => user[:user_name])
                end 
            end 
        end 
    end
end
