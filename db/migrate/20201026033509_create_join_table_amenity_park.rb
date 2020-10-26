class CreateJoinTableAmenityPark < ActiveRecord::Migration[6.0]
  def change
    create_join_table :amenity, :park do |t|
      t.index [:amenity_id, :park_id] 
      t.index [:park_id, :amenity_id]
    end 
  end
end
